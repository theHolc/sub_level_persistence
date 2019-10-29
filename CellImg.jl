using Images, Colors, ImageSegmentation

function colimgtobw(cimg)
    return colimgtobw(cimg, .5)
end

function colimgtobw(cimg, changeFactor)
    bw = Gray.(cimg).>changeFactor
    bwimg = Array{Float64}(size(cimg))
    for i in 1:size(bwimg)[1]
        for j in 1:size(bwimg)[2]
            if bw[i,j]
                bwimg[i,j] = 1
            else
                bwimg[i,j] = 0
            end
        end
    end
    return Gray.(bwimg)
end

function getbinarray(img)
    return getbinarray(img, 0.5)
end

function getbinarray(img, changeFactor)
    bw = Gray.(img).>changeFactor
    bwimg = Array{Int64}(size(img))
    for i in 1:size(bwimg)[1]
        for j in 1:size(bwimg)[2]
            if bw[i,j]
                bwimg[i,j] = 0
            else
                bwimg[i,j] = 1
            end
        end
    end
    return bwimg
end
