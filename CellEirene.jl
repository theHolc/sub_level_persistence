include("CellImg.jl")
include("CellTime.jl")
include("CellComplex.jl")
using Eirene

function eirenematrix(m,n,fv,ev,vv)
  v = find(vv)
  e = find(ev)
  f = find(fv)
  N = (size(v)[1])+(size(e)[1])+(size(f)[1])
  ematrix = zeros(Int8,N,N)

  for i in 1:size(e)[1]
    ve = vertexofedge(m,n,e[i])
    ematrix[findfirst(v,ve[1]),size(v)[1]+i] = 1
    ematrix[findfirst(v,ve[2]),size(v)[1]+i] = 1
  end

  for i in 1:size(f)[1]
    ef = edgeofface(m,n,f[i])
    ematrix[(findfirst(e,ef[1])+size(v)[1]),(size(v)[1] + size(e)[1] + i)] = 1
    ematrix[(findfirst(e,ef[2])+size(v)[1]),(size(v)[1] + size(e)[1] + i)] = 1
    ematrix[(findfirst(e,ef[3])+size(v)[1]),(size(v)[1] + size(e)[1] + i)] = 1
    ematrix[(findfirst(e,ef[4])+size(v)[1]),(size(v)[1] + size(e)[1] + i)] = 1
  end

  return ematrix
end

function eirenematrix(a)
  return eirenematrix(size(a)[1],size(a)[2],facevector(a), edgevector(a), vertexvector(a))
end

function celltimes(a,v)
  return celltimes(size(a)[1],size(a)[2],facevector(a),edgevector(a),vertexvector(a),v)
end

function celltimes(m,n,fv,ev,vv,uv)
  v = find(vv)
  e = find(ev)
  f = find(fv)
  vt = vertextimes(m,n,uv[1],uv[2])
  et = edgetimes(m,n,uv[1],uv[2])
  ft = facetimes(m,n,uv[1],uv[2])
  N = (size(v)[1])+(size(e)[1])+(size(f)[1])
  timevector = zeros(N)

  for i in 1:size(v)[1]
    timevector[i] = vt[v[i]]
  end
  for i in 1:size(e)[1]
    timevector[i + size(v)[1]] = et[e[i]]
  end
  for i in 1:size(f)[1]
    timevector[i + size(v)[1]+size(e)[1]] = ft[f[i]]
  end

  return timevector
end

function celldimension(a)
  return celldimension(size(a)[1],size(a)[2],facevector(a),edgevector(a),vertexvector(a))
end

function celldimension(m,n,fv,ev,vv)
  v = find(vv)
  e = find(ev)
  f = find(fv)
  N = (size(v)[1])+(size(e)[1])+(size(f)[1])
  dimv = zeros(Int8,N)
  k = size(v)[1]+1
  for i in 1:size(e)[1]
    dimv[k] = 1
    k += 1
  end
  for i in 1:size(f)[1]
    dimv[k] = 2
    k += 1
  end
  return dimv
end

function calcph(img,vect)
  a = getbinarray(img)
  d = eirenematrix(a)
  D = sparse(d)
  rv = D.rowval
  cp = D.colptr
  fv = celltimes(a,vect)
  dv = celldimension(a)
  return eirene(rv=rv,cp=cp,fv=fv,dv=dv)
end
