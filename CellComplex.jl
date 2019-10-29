function facevector(a)
  return vec(a)
end

function edgevector(a)
  m = size(a)[1]
  n = size(a)[2]
  edgenum = (m+1)*(n) + (m)*(n+1)
  ev = zeros(edgenum)
  k = 1

  #Get right edge
  for i in 1:m
    ev[k] = a[i,1]
    k += 1
  end
  #Get middle edges
  for j in 1:(n-1)
    for i in 1:m
      if a[i,j] == 1 || a[i,j+1] == 1
        ev[k] = 1
      end
      k += 1
    end
  end
  #Get left edge
  for i in 1:m
    ev[k] = a[i,n]
    k += 1
  end

  #Get horizontal edge
  for j in 1:n
    ev[k] = a[1,j]
    k += 1
    for i in 1:(m-1)
      if a[i,j] == 1 || a[i+1,j] == 1
        ev[k] = 1
      end
      k += 1
    end
    ev[k] = a[m,j]
    k += 1
  end
  return ev
end

function vertexvector(a)
  m = size(a)[1]
  n = size(a)[2]
  vertexnum = (m+1)*(n+1)

  vv = zeros(vertexnum)
  k = 1
  vv[k] = a[1,1]
  k += 1
  for i in 1:(m-1)
    if a[i,1] == 1 || a[i+1,1] == 1
      vv[k] = 1
    end
    k += 1
  end
  vv[k] = a[m,1]
  k += 1

  for j in 1:(n-1)
    if a[1,j] == 1 || a[1,j+1] == 1
      vv[k] = 1
    end
    k += 1
    for i in 1:(m - 1)
      if a[i,j] == 1 || a[i+1,j] == 1 || a[i,j+1] == 1 || a[i+1,j+1] == 1
        vv[k] = 1
      end
      k += 1
    end
    if a[m,j] == 1|| a[m,j+1] == 1
      vv[k] = 1
    end
    k += 1
  end
  vv[k] = a[1,n]
  k += 1
  for i in 1:(m-1)
    if a[i,n] == 1 || a[i+1,n] == 1
      vv[k] = 1
    end
    k += 1
  end
  vv[k] = a[m,n]
  return vv
end

function vertexofedge(m,n,k)
  vertices = [0,0]
  if k <= (m)*(n+1)
    vertices[1] = floor((k - 1)/m) + k
    vertices[2] = vertices[1] + 1
  else
    vertices[1] = k - (m)*(n+1)
    vertices[2] = vertices[1] + (m + 1)
  end
  return vertices

end

function edgeofface(m,n,k)
  top = (m)*(n+1) + floor((k-1)/m) + k
  return [k,k+m,top ,top + 1]
end

function vertexofface(m,n,k)
  edges = edgeofface(m,n,k)
  leftedge = edges[1]
  rightedge = edges[2]
  vertleft = vertexofedge(m,n,leftedge)
  vertright = vertexofedge(m,n,rightedge)
  return [vertleft[1],vertleft[2],vertright[1],vertright[2]]
end

function vertexofedge(a,k)
  return vertexofedge(size(a)[1],size(a)[2],k)
end

function edgeofface(a,k)
  return edgeofface(size(a)[1],size(a)[2],k)
end

function vertexofface(a,k)
  return vertexofface(size(a)[1],size(a)[2],k)
end
