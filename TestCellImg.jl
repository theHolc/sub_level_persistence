include("CellImg.jl")

function arrayequals(a1,a2)
  m = size(a1)[1]
  n = size(a1)[2]
  if m != size(a2)[1] || n != size(a2)[2]
    return false
  end
  for i in 1:m
    for j in 1:n
      if a1[i,j] != a2[i,j]
        return false
      end
    end
  end
  return true
end

print("circ: \t")
println(arrayequals([1 1 1 ; 1 0 1 ; 1 1 1],getbinarray(load("testimgcirc.png"))))
print("don: \t")
println(arrayequals([1 1 1 1 1 1 ; 1 0 1 1 0 1 ; 1 1 1 1 1 1],getbinarray(load("testimgdon.png"))))
print("L: \t")
println(arrayequals([1 1 ; 1 0],getbinarray(load("testimgL.png"))))
