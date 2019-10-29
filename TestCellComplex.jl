include("CellComplex.jl")

m1 = [0 0;0 0]
m2 = [1 1; 1 1]
m3 = [1 0 1; 1 0 1; 1 0 1]
m4 = [1 1 1; 0 0 0; 1 1 1]
m5 = [1 1 0 0 1 ; 0 0 0 0 1; 1 1 0 0 1]

function vectorsequal(v1,v2)
  if size(v1)[1] != size(v2)[1]
    return false
  end

  for i in 1:size(v1)[1]
    if v1[i] != v2[i]
      return false
    end
  end
  return true
end

print("test m1 facevector: \t")
println(vectorsequal([0,0,0,0],facevector(m1)))
print("test m2 facevector: \t")
println(vectorsequal([1,1,1,1],facevector(m2)))

print("test m3 facevector: \t")
println(vectorsequal([1,1,1,0,0,0,1,1,1],facevector(m3)))
print("test m4 facevector: \t")
println(vectorsequal([1,0,1,1,0,1,1,0,1],facevector(m4)))

print("test m5 facevector: \t")
println(vectorsequal([1,0,1,1,0,1,0,0,0,0,0,0,1,1,1],facevector(m5)))
println("\n\n\n")
#######################################################################
print("test m1 edgevector: \t")
println(vectorsequal([0,0,0,0,0,0,0,0,0,0,0,0],edgevector(m1)))
print("test m2 edgevector: \t")
println(vectorsequal([1,1,1,1,1,1,1,1,1,1,1,1],edgevector(m2)))


print("test m3 edgevector: \t")
println(vectorsequal([1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,1,1,1,1],edgevector(m3)))
print("test m4 edgevector: \t")
println(vectorsequal([1,0,1,1,0,1,1,0,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1],edgevector(m4)))

print("test m5 edgevector: \t")
println(vectorsequal([1,0,1,1,0,1,1,0,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,1,1,1,1],edgevector(m5)))
println("\n\n\n")
###########################################################################
print("test m1 vertexvector: \t")
println(vectorsequal([0,0,0,0,0,0,0,0,0],vertexvector(m1)))
print("test m2 vertexvector: \t")
println(vectorsequal([1,1,1,1,1,1,1,1,1],vertexvector(m2)))

print("test m3 vertexvector: \t")
println(vectorsequal([1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],vertexvector(m3)))
print("test m4 vertexvector \t")
println(vectorsequal([1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],vertexvector(m4)))

print("test m5 vertexvector: \t")
println(vectorsequal([1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,1,1],vertexvector(m5)))
println("\n\n\n")
#############################################################################
println("For the methods vertexofedge, edgeofface, vertexofface, the tests will be added later. These are overall easily seen to be algorithmic.")
