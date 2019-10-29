include("CellTime.jl")

a = zeros(3,3)

function timeequals(t1,t2,se)
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

timeequals([1,1],[1,1],.01)

#Test unitvector method
print("test unitvector for (0,0): \t")
println(timeequals(unitvector(0,0),[0,0],.001))

print("test unitvector for (1,1): \t")
println(timeequals(unitvector(1,1),[sqrt(2)/2,sqrt(2)/2],.001))

print("test unitvector for (3,4): \t")
println(timeequals(unitvector(3,4),[(3.0)/(5.0),(4.0)/(5.0)],.001))

print("test unitvector for (1,sqrt(3)): \t")
println(timeequals(unitvector(1,sqrt(3)),[(1.0)/(2.0),sqrt(3)/2],.001))

print("test unitvector for (sqrt(3),1): \t")
println(timeequals(unitvector(sqrt(3),1),[sqrt(3)/(2.0),(1.0)/(2.0)],.001))
println("\n\n\n")

#Test vertextimes
#Test simplest unit vectors
print("Test vertextimes(a,0,0): \t")
println(timeequals(vertextimes(a,0,0),zeros(16),.001))

print("Test vertextimes(a,0,1): \t")
println(timeequals(vertextimes(a,0,1),[3,2,1,0,3,2,1,0,3,2,1,0,3,2,1,0],.001))

print("Test vertextimes(a,0,-1): \t")
println(timeequals(vertextimes(a,0,-1),[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3],.001))

print("Test vertextimes(a,1,0): \t")
println(timeequals(vertextimes(a,1,0),[0,0,0,0,1,1,1,1,2,2,2,2,3,3,3,3],.001))

print("Test vertextimes(a,-1,0): \t")
println(timeequals(vertextimes(a,-1,0),[3,3,3,3,2,2,2,2,1,1,1,1,0,0,0,0],.001))

#Test more complicated unit vectors
print("Test vertextimes(a,1,-1): \t")
println(timeequals(vertextimes(a,1,-1),[0,sqrt(2)/2,sqrt(2),3*(sqrt(2)/2),sqrt(2)/2,sqrt(2),3*(sqrt(2)/2),2*sqrt(2), sqrt(2),3*(sqrt(2)/2),2*(sqrt(2)),5*(sqrt(2)/2),3*(sqrt(2)/2),2*(sqrt(2)),5*(sqrt(2)/2),3*(sqrt(2))],.001))

print("Test vertextimes(a,-1,-1): \t")
println(timeequals(vertextimes(a,-1,-1),[3*(sqrt(2)/2),2*sqrt(2),5*(sqrt(2)/2),3*sqrt(2),sqrt(2),3*(sqrt(2)/2),2*sqrt(2),5*(sqrt(2)/2),sqrt(2)/2,sqrt(2),3*(sqrt(2)/2),2*sqrt(2),0,sqrt(2)/2,sqrt(2),3*(sqrt(2)/2)],.001))

print("Test vertextimes(a,-1,sqrt(3)): \t")
println(timeequals(vertextimes(a,-1,sqrt(3)),[1.5 + 3*(sqrt(3)/2),1.5 + sqrt(3),1.5+sqrt(3)/(2.0),1.5,1+3*(sqrt(3)/2),sqrt(3)+1,1+sqrt(3)/(2.0),1,(1+3*sqrt(3))/(2.0),sqrt(3)+(1.0)/(2.0),(sqrt(3)+1.0)/(2.0),(1.0)/(2.0),3*(sqrt(3)/2),sqrt(3),sqrt(3)/2,0],.001))

print("Test vertextimes(a,sqrt(3),1): \t")
println(timeequals(vertextimes(a,sqrt(3),1),[1.5,1,(1.0)/(2.0),0,1.5+sqrt(3)/2,1+sqrt(3)/2,.5+sqrt(3)/2,sqrt(3)/2,1.5 + sqrt(3),1 + sqrt(3),.5 + sqrt(3),sqrt(3),1.5 + 3*(sqrt(3)/2),1 + 3*(sqrt(3)/2),.5 + 3*(sqrt(3)/2),3*(sqrt(3)/2)],.001))

#Test edgetimes
b = zeros(2,2)

print("Test edgetimes(b,1,-1): \t")
println(timeequals(edgetimes(b,1,-1),[sqrt(2)/2,sqrt(2),sqrt(2),3*(sqrt(2)/2),3*(sqrt(2)/2),2*sqrt(2),sqrt(2)/2,sqrt(2),3*(sqrt(2)/2),sqrt(2),3*(sqrt(2)/2),2*sqrt(2)],.001))

print("Test edgetimes(b,-1,-1): \t")
println(timeequals(edgetimes(b,-1,-1),[3*(sqrt(2)/2),2*sqrt(2),sqrt(2),3*(sqrt(2)/2),sqrt(2)/2,sqrt(2),sqrt(2),3*(sqrt(2)/2),2*sqrt(2),sqrt(2)/2,sqrt(2),3*(sqrt(2)/2)],.001))

print("Test edgetimes(b,-1,sqrt(3)): \t")
println(timeequals(edgetimes(b,-1,sqrt(3)),[1+sqrt(3),1+sqrt(3)/2,.5+sqrt(3),.5+sqrt(3)/2,sqrt(3),sqrt(3)/2,1+sqrt(3),1+sqrt(3)/2,1,.5+sqrt(3),.5+sqrt(3)/2,.5],.001))

print("Test edgetimes(b,sqrt(3),1): \t")
println(timeequals(edgetimes(b,sqrt(3),1),[1,.5,1+sqrt(3)/2,sqrt(3)/2+.5,1+sqrt(3),.5+sqrt(3),1+sqrt(3)/2,sqrt(3)/2+.5,sqrt(3)/2,1+sqrt(3),.5+sqrt(3),sqrt(3)],.001))

#Test facetimes
print("Test facetimes(a,1,-1): \t")
println(timeequals(facetimes(a,1,-1),[sqrt(2),3*(sqrt(2)/2),2*sqrt(2),3*(sqrt(2)/2),2*sqrt(2),5*(sqrt(2)/2),2*sqrt(2),5*(sqrt(2)/2),3*sqrt(2)],.001))

print("Test facetimes(a,-1,-1): \t")
println(timeequals(facetimes(a,-1,-1),[2*sqrt(2),5*(sqrt(2)/2),3*sqrt(2),3*(sqrt(2)/2),2*sqrt(2),5*(sqrt(2)/2),sqrt(2),3*(sqrt(2)/2),2*sqrt(2)],.001))

print("Test facetimes(a,-1,sqrt(3)): \t")
println(timeequals(facetimes(a,-1,sqrt(3)),[1.5 + 3*(sqrt(3)/2),1.5+sqrt(3),1.5+sqrt(3)/2,1+3*(sqrt(3)/2),1+sqrt(3),1+sqrt(3)/2,.5+3*(sqrt(3)/2),sqrt(3)+.5,.5+sqrt(3)/2],.001))

print("Test facetimes(a,sqrt(3),1): \t")
println(timeequals(facetimes(a,sqrt(3),1),[1.5+sqrt(3)/2,1+sqrt(3)/2,.5+sqrt(3)/2,1.5 + sqrt(3),1+sqrt(3),.5+sqrt(3),1.5+3*(sqrt(3)/2),1 + 3*(sqrt(3)/2),.5 + 3*(sqrt(3)/2)],.001))
