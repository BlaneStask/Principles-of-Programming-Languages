-- 1
type Node = Int
type Edge = (Node, Node)
type Graph = [Edge]
type Path = [Node]

-- a
nodes :: Graph -> [Node]
nodes [] = []
nodes (x:xs) = fst x : snd x : nodes xs 

-- b
adj :: Node -> Graph -> [Node]
adj n [] = []
adj n (x:xs)
    | n == fst x  = (snd x) : (adj n xs)
    | otherwise = adj n xs
    
-- c
detach :: Node -> Graph -> Graph
detach n [] = []
detach n (x:xs) 
    | n == fst x = detach n xs
    | n == snd x = detach n xs
    | otherwise = x : detach n xs
    
-- d
path :: Node -> Node -> Graph -> [Path]
path n m [] = []
path n m g
    | n == m = [[m]]
    | adj n g == [] = []
    | otherwise = n : [path y m (detach n g) | y <- adj n g]

-- 2
type Key = Int
type Value = Int
type Pair = (Key, Value)
type Map = [Pair]

-- size
size :: Map -> Int
size m = length m

-- insert
insert :: Pair -> Map -> Map
insert p [] = p : []
insert p m = p : m

-- get
get :: Key -> Map -> Value
get k [] = 0
get k (x:xs)
    | k == fst x = snd x
    | otherwise = get k xs

-- remove
remove :: Key -> Map -> Map
remove k [] = []
remove k (x:xs) 
    | k == fst x = remove k xs
    | otherwise = x : remove k xs

main::IO()
main = do
  -- 2
  putStrLn "Part 2:"
  print(get 2 [])
  print(get 2 [(1,5), (2, 19), (3, 7)])
  print(size [(2,2), (1,2), (4,1)])
  print(insert (4,2) [])
  print(insert (4,2) [(2,2), (1,2), (3,1)])
  print(remove 3 [])
  print(remove 3 [(2,2), (1,2), (3,1)])

  -- 1
  putStrLn "Part 1:"
  print(nodes [])
  print(nodes [(1,2), (1, 3), (2, 3), (2, 4), (3, 4)])
  print(adj 2 [])
  print(adj 2 [(1,2), (1, 3), (2, 3), (2, 4), (3, 4)])
  print(adj 4 [(1,2), (1, 3), (2, 3), (2, 4), (3, 4)])
  print(detach 3 [])
  print(detach 4 [(1,2), (1, 3), (2, 3), (2, 4), (3, 4)])
