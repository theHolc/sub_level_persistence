include("CellEirene.jl")
include("CellImg.jl")
using Eirene
a = [1 1;1 0]

function testmatrix(t1,t2,se)
  if size(t1) != size(t2)
    return false
  end
  for i in 1:size(t1)[1]
    for j in 1:size(t1)[2]
      if !(t1[i,j] >= (t2[i,j] - se) && t1[i,j] <= (t2[i,j] + se))
        return false
      end
    end
  end
  return true
end

function testvector(t1,t2,se)
  if size(t1) != size(t2)
    return false
  end
  for i in 1:size(t1)[1]
      if !(t1[i] >= (t2[i] - se) && t1[i] <= (t2[i] + se))
        return false
      end
  end
  return true
end

expectedMatrix = zeros(21,21)
x = [1,1,2,2,2,3,3,4,4,4,5,5,5,5,6,6,7,7,8,8]
y = [9,14,9,10,15,10,16,11,14,17,11,12,15,18,12,16,13,17,13,18]
for i in 1:20
  expectedMatrix[x[i],y[i]] = 1
end
f = [9,10,11,11,12,13,14,15,15,16,17,18]
g = [19,20,19,21,20,21,19,19,20,20,21,21]
for j in 1:12
  expectedMatrix[f[j],g[j]] = 1
end


#Test eirenematrix
print("test eirenematrix(a): \t")
println(testmatrix(eirenematrix(a),expectedMatrix,.001))

#Test celltimes
print("test celltimes(a,[sqrt(3),-1]): \t")
println(testvector(celltimes(a,[sqrt(3),-1]),[0,.5,1,sqrt(3)/2,.5+sqrt(3)/2,1+sqrt(3)/2,sqrt(3),.5+sqrt(3),.5,1,.5+sqrt(3)/2,1+sqrt(3)/2,.5+sqrt(3),sqrt(3)/2,.5+sqrt(3)/2,1+sqrt(3)/2,sqrt(3),.5+sqrt(3),.5+sqrt(3)/2,1+sqrt(3)/2,.5+sqrt(3)],.001))

#Test celldimension
print("test celldimension(a): \t")
println(testvector(celldimension(a),[0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,2,2,2],.001))

#Test calcph
#Test testimgL.png
println("test L")
ph1 = calcph(load("testimgL.png"),[1,-1])
#Test testimgcirc.png
println("test Circle")
ph2 = calcph(load("testimgcirc.png"),[1,-1])
#Test testimgdon.png
println("test Don")
ph3 = calcph(load("testimgdon.png"),[1,-1])
println("\n\n\n")
plotpersistencediagram_pjs(ph1)
plotpersistencediagram_pjs(ph2)
plotpersistencediagram_pjs(ph3)
