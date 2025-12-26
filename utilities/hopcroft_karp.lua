INF = 2147483647
NIL = 0

--- Based on https://www.geeksforgeeks.org/dsa/hopcroft-karp-algorithm-for-maximum-matching-set-2-implementation/
--- Converted to Lua by your local Pretzal :)

--- A class to represent Bipartite graph for Hopcroft
--- Karp implementation
BipGraph = Object:extend()
--- Constructor
function BipGraph:init(m, n)
  --- m and n are number of vertices on left
  --- and right sides of Bipartite Graph
  self.__m = m
  self.__n = n
  --- adj[u] stores adjacents of left side
  --- vertex 'u'. The value of u ranges from 1 to m.
  --- 0 is used for dummy vertex
  self.__adj = {}
  for k = 0, m do
    self.__adj[k] = {}
  end
end

--- To add edge from u to v and v to u
function BipGraph:addEdge(u, v)
  self.__adj[u][#self.__adj[u] + 1] = v --- Add u to v’s list.
end

--- Returns true if there is an augmenting path, else returns
--- false
function BipGraph:bfs()
  Q = {}
  --- First layer of vertices (set distance as 0)
  for u = 1, self.__m do
    --- If this is a free vertex, add it to queue
    if self.__pairU[u] == NIL then
      --- u is not matched
      self.__dist[u] = 0
      Q[#Q + 1] = u
      --- Else set distance as infinite so that this vertex
      --- is considered next time
    else
      self.__dist[u] = INF
    end
  end
  --- Initialize distance to NIL as infinite
  self.__dist[NIL] = INF
  --- Q is going to contain vertices of left side only.
  while #Q > 0 do
    --- Dequeue a vertex
    u = table.remove(Q, 1)
    --- If this node is not NIL and can provide a shorter path to NIL
    if self.__dist[u] < self.__dist[NIL] then
      --- Get all adjacent vertices of the dequeued vertex u

      for _, v in pairs(self.__adj[u]) do
        ---  If pair of v is not considered so far
        --- (v, pairV[V]) is not yet explored edge.
        if self.__dist[self.__pairV[v]] == INF then
          --- Consider the pair and add it to queue
          self.__dist[self.__pairV[v]] = self.__dist[u] + 1
          Q[#Q + 1] = self.__pairV[v]
        end
      end
    end
  end
  --- If we could come back to NIL using alternating path of distinct
  --- vertices then there is an augmenting path
  return self.__dist[NIL] ~= INF
end

--- Returns true if there is an augmenting path beginning with free vertex u
function BipGraph:dfs(u)
  if u ~= NIL then
    --- Get all adjacent vertices of the dequeued vertex u
    for _, v in pairs(self.__adj[u]) do
      if self.__dist[self.__pairV[v]] == (self.__dist[u] + 1) then
        --- If dfs for pair of v also returns true
        if self:dfs(self.__pairV[v]) then
          self.__pairV[v] = u
          self.__pairU[u] = v
          return true
        end
      end
    end
    --- If there is no augmenting path beginning with u.
    self.__dist[u] = INF
    return false
  end
  return true
end

function BipGraph:hopcroftKarp()
  --- pairU[u] stores pair of u in matching where u
  --- is a vertex on left side of Bipartite Graph.
  --- If u doesn't have any pair, then pairU[u] is NIL
  self.__pairU = {}
  for k = 0, self.__m do
    self.__pairU[k] = 0
  end

  --- pairV[v] stores pair of v in matching. If v
  --- doesn't have any pair, then pairU[v] is NIL
  self.__pairV = {}
  for k = 0, self.__n do
    self.__pairV[k] = 0
  end

  --- dist[u] stores distance of left side vertices
  --- dist[u] is one more than dist[u'] if u is next
  --- to u'in augmenting path
  self.__dist = {}
  for k = 0, self.__m do
    self.__dist[k] = 0
  end
  --- Initialize result
  local result = 0

  --- Keep updating the result while there is an
  --- augmenting path.
  while self:bfs() do
    --- Find a free vertex
    for u = 1, self.__m do
      --- If current vertex is free and there is
      --- an augmenting path from current vertex
      if self.__pairU[u] == NIL and self:dfs(u) then
        result = result + 1
      end
    end
  end
  return result
end
