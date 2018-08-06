import pdb

def Dijkstra(source, target, myList):
    '''
    source = '2'
    target = '5'
    myList = [[0,3,4,0,0,0,0],
          [0,0,0,4,6,0,0],
		  [0,0,0,0,6,0,0],
		  [0,0,0,0,0,5,0],
		  [0,0,0,0,0,7,5],
		  [0,0,0,0,0,0,0],
		  [0,0,0,0,0,0,0]]
	'''
	
	## 1. sparse myList into hash
    graph = {}
    n = len(myList)
    for i in range(n):
	    for j in range(n):
			if str(i) not in graph:
				graph[str(i)] = {}
			if myList[i][j] != 0:
			    tmp = graph[str(i)]
			    tmp[str(j)] = myList[i][j]

    '''
    graph = {'0': {'1': 3, '2': 4},
		'1': {'3': 4, '4': 6},
		'2': {'4': 6},
		'3': {'5': 5},
		'4': {'5': 7, '6': 5},
		'5': {},
		'6': {}}
    '''		

    # dist: store all distance from "source" to this node;
    # prev: sotre the previous node of current node;
    # visited: lable whether this node being visited or not;
    # Q: as a container, includes {vertex: dist(vertex)}
    dist = {}
    prev = {}
    visited = {}
    Q = {}

    ## 2. initialize dist, prev, visited
    for v in graph:
	    dist[v] = float('Inf')	# set all dist to infinity
	    prev[v] = -1			# set all previous node is -1
	    visited[v] = False		# set all vertex unvisited
	
    dist[source] = 0			# set dist of "sourece" vertex to 0
    Q = {source: dist[source]}
    min_val = 0

    while bool(Q) == True:
	    u = min(Q, key=Q.get)	# get the min of dist in Q
	    Q.pop(u)				# remove it
	    visited[u] = True		# labeled as visited
	    
	    for v in graph[u]:
		    if visited[v] == False:
			    alt = dist[u] + graph[u][v]
			    if alt < dist[v]:
				    dist[v] = alt
				    prev[v] = u
				    new = {v:alt}
				    Q.update(new)


    ind_path = []				# store the index of path
    ind_path.append(target)
    tmp = prev[target]
    while tmp != source:
	    ind_path.append(tmp)
	    tmp = prev[tmp]
    
    ind_path.append(source)
    ind_path = ind_path[::-1]
    
    print ind_path
    
    pdb.set_trace()
	
if __name__ == "__main__":
    source = '2'
    target = '6'
    myList = [[0,3,4,0,0,0,0],
          [0,0,0,4,6,0,0],
		  [0,0,0,0,6,0,0],
		  [0,0,0,0,0,5,0],
		  [0,0,0,0,0,7,5],
		  [0,0,0,0,0,0,0],
		  [0,0,0,0,0,0,0]]
		  
    Dijkstra(source, target, myList)
