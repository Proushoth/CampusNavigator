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
    @State private var startText: String = ""
    @State private var destinationText: String = ""
    
    let mapWidth: CGFloat = 410
    let mapHeight: CGFloat = 450
    
    var body: some View {
        ZStack(alignment: .top) {
            ZStack {
                Image("CampusMap")
                    .resizable()
                    .frame(width: mapWidth, height: mapHeight)
                    .offset(y: 95)
                
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
            .offset(y: 40)
            
            VStack(spacing: 12) {
                TextField("Start Location", text: $startText)
                    .textFieldStyle(EnhancedTextFieldStyle())
                
                TextField("Destination", text: $destinationText)
                    .textFieldStyle(EnhancedTextFieldStyle())
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)
        }
        .onAppear {
            setupMockData()
        }
    }
    
    private func handleSelection(of node: CampusNode) {
        if selectedStart == nil {
            selectedStart = node
            startText = node.name
        } else if selectedEnd == nil && node != selectedStart {
            selectedEnd = node
            destinationText = node.name
            if let start = selectedStart, let end = selectedEnd {
                path = graph.shortestPath(from: start, to: end)
            }
        } else {
            selectedStart = nil
            selectedEnd = nil
            startText = ""
            destinationText = ""
            path = []
        }
    }
    
    private func setupMockData() {
        let nodeA = CampusNode(name: "Library", x: 110, y: 395)
        let nodeB = CampusNode(name: "Lecture Hall", x: 260, y: 400)
        let nodeC = CampusNode(name: "Study Hall", x: 115, y: 525)
        let nodeD = CampusNode(name: "Auditorium", x: 320, y: 505)
        let nodeE = CampusNode(name: "Admin Office", x: 260, y: 558)
        let nodeF = CampusNode(name: "Student Center", x: 115, y: 660)
        
        graph.nodes = [nodeA, nodeB, nodeC, nodeD, nodeE, nodeF]
        
        graph.addEdge(from: nodeA, to: nodeB)
        graph.addEdge(from: nodeB, to: nodeC)
        graph.addEdge(from: nodeC, to: nodeD)
        graph.addEdge(from: nodeA, to: nodeD)
        graph.addEdge(from: nodeB, to: nodeD)
        graph.addEdge(from: nodeD, to: nodeE)
        graph.addEdge(from: nodeB, to: nodeE)
        graph.addEdge(from: nodeE, to: nodeF)
        graph.addEdge(from: nodeF, to: nodeA)
    }
}

struct EnhancedTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(12)
            .background(Color.white)
            .cornerRadius(8)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
            )
            .font(.system(size: 16, weight: .medium))
    }
}

struct CampusMapView_Previews: PreviewProvider {
    static var previews: some View {
        CampusMapView()
    }
}
