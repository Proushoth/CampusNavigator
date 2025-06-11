import SwiftUI

struct CampusNode: Identifiable, Hashable {
    let id: UUID = UUID()
    let name: String
    let x: CGFloat
    let y: CGFloat
}

struct CampusEdge {
    let from: CampusNode
    let to: CampusNode
    let distance: Double
}

class CampusGraph: ObservableObject {
    @Published var nodes: [CampusNode] = []
    @Published var edges: [CampusEdge] = []
    
    let scale: Double = 0.15
    
    func addEdge(from: CampusNode, to: CampusNode) {
        let dx = Double(from.x - to.x)
        let dy = Double(from.y - to.y)
        let pixelDistance = sqrt(dx * dx + dy * dy)
        let realDistance = pixelDistance * scale
        edges.append(CampusEdge(from: from, to: to, distance: realDistance))
    }
    
    func neighbors(of node: CampusNode) -> [CampusEdge] {
        edges.filter { $0.from == node }
    }

    func shortestPath(from start: CampusNode, to goal: CampusNode) -> [CampusNode] {
        var distances: [CampusNode: Double] = [start: 0]
        var previous: [CampusNode: CampusNode] = [:]
        var unvisited = Set(nodes)

        while let current = unvisited.min(by: { (distances[$0] ?? Double.infinity) < (distances[$1] ?? Double.infinity) }) {
            if current == goal { break }
            unvisited.remove(current)

            for edge in neighbors(of: current) {
                let alt = (distances[current] ?? Double.infinity) + edge.distance
                if alt < (distances[edge.to] ?? Double.infinity) {
                    distances[edge.to] = alt
                    previous[edge.to] = current
                }
            }
        }

        var path: [CampusNode] = []
        var current: CampusNode? = goal
        while current != nil {
            path.insert(current!, at: 0)
            current = previous[current!]
        }
        return path
    }
}

struct CampusMapView: View {
    @StateObject private var graph = CampusGraph()
    @State private var selectedStart: CampusNode?
    @State private var selectedEnd: CampusNode?
    @State private var path: [CampusNode] = []

    let mapWidth: CGFloat = 350
    let mapHeight: CGFloat = 500

    var body: some View {
        ZStack {
            Image("CampusMap")
                .resizable()
                .frame(width: mapWidth, height: mapHeight)

            ForEach(graph.nodes) { node in
                Circle()
                    .fill(selectedStart == node ? Color.green :
                          selectedEnd == node ? Color.blue : Color.red)
                    .frame(width: 20, height: 20)
                    .position(x: node.x, y: node.y)
                    .onTapGesture {
                        handleSelection(of: node)
                    }
            }

            if path.count > 1 {
                Path { pathObj in
                    pathObj.move(to: CGPoint(x: path[0].x, y: path[0].y))
                    for node in path.dropFirst() {
                        pathObj.addLine(to: CGPoint(x: node.x, y: node.y))
                    }
                }
                .stroke(Color.yellow, lineWidth: 4)
            }
        }
        .onAppear {
            setupMockData()
        }
    }

    private func handleSelection(of node: CampusNode) {
        if selectedStart == nil {
            selectedStart = node
        } else if selectedEnd == nil && node != selectedStart {
            selectedEnd = node
            if let start = selectedStart, let end = selectedEnd {
                path = graph.shortestPath(from: start, to: end)
            }
        } else {
            selectedStart = nil
            selectedEnd = nil
            path = []
        }
    }

    private func setupMockData() {
        let nodeA = CampusNode(name: "Library", x: 100, y: 150)
        let nodeB = CampusNode(name: "Lecture Hall 1", x: 250, y: 100)
        let nodeC = CampusNode(name: "Study Hall", x: 300, y: 300)
        let nodeD = CampusNode(name: "Auditorium", x: 150, y: 400)

        graph.nodes = [nodeA, nodeB, nodeC, nodeD]
        graph.addEdge(from: nodeA, to: nodeB)
        graph.addEdge(from: nodeB, to: nodeC)
        graph.addEdge(from: nodeC, to: nodeD)
        graph.addEdge(from: nodeA, to: nodeD)
        graph.addEdge(from: nodeB, to: nodeD)
    }
}


struct CampusMapView_Previews: PreviewProvider {
    static var previews: some View {
        CampusMapView()
    }
}
