include("CellComplex.jl")

function unitvector(x,y)
  if x == 0 && y == 0
    return [0,0]  #Should not divide by zero. Default: unit vector of [1,1]
  end
  norm = sqrt(x*x + y*y)
  return [x/norm,y/norm]
end

function unitvector(v)
  return unitvector(v[1],v[2])
end

function vertextimes(m,n,vx,vy)
  time = zeros((m+1)*(n+1))
  uv = unitvector(vx,vy)
  x = uv[1]
  y = uv[2]
  k = 1

  for j in 1:(n+1)
    for i in 1:(m+1)
      xcomp = 0
      ycomp = 0

      if x <= 0
        xcomp = x*(j - n - 1)
      else
        xcomp = x*(j - 1)
      end

      if y <= 0
        ycomp = y*(1-i)
      else
        ycomp = y*(m+1-i)
      end
      time[k] = xcomp + ycomp
      k += 1
    end
  end
  return time
end

function edgetimes(m,n,x,y)
  time = zeros((m+1)*(n)+(m)*(n+1))
  vtimes = vertextimes(m,n,x,y)
  for i in 1:((m+1)*(n)+(m)*(n+1))
    v = vertexofedge(m,n,i)
    time[i] = maximum(vtimes[v[1]],vtimes[v[2]])
  end
  return time
end

function facetimes(m,n,x,y)
  time = zeros(m*n)
  vtimes = vertextimes(m,n,x,y)
  for i in 1:(m*n)
    v = vertexofface(m,n,i)
    time[i] = maximum(vtimes[v[1]],vtimes[v[2]],vtimes[v[3]],vtimes[v[4]])
  end
  return time
end


function vertextimes(a,x,y)
  return vertextimes(size(a)[1],size(a)[2],x,y)
end
function edgetimes(a,x,y)
  return edgetimes(size(a)[1],size(a)[2],x,y)
end
function facetimes(a,x,y)
  return facetimes(size(a)[1],size(a)[2],x,y)
end


function vertextimes(a,v)
  return vertextimes(size(a)[1],size(a)[2],v[1],v[2])
end
function edgetimes(a,v)
  return edgetimes(size(a)[1],size(a)[2],v[1],v[2])
end
function facetimes(a,v)
  return facetimes(size(a)[1],size(a)[2],v[1],v[2])
end


function vertextimes(m,n,v)
  return vertextimes(m,n,v[1],v[2])
end
function edgetimes(m,n,v)
  return edgetimes(m,n,v[1],v[2])
end
function facetimes(m,n,v)
  return facetimes(m,n,v[1],v[2])
end
