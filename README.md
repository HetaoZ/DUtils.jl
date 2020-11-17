# DUtils

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://HetaoZ.github.io/DUtils.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://HetaoZ.github.io/DUtils.jl/dev)
[![Build Status](https://github.com/HetaoZ/DUtils.jl/workflows/CI/badge.svg)](https://github.com/HetaoZ/DUtils.jl/actions)
[![Coverage](https://codecov.io/gh/HetaoZ/DUtils.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/HetaoZ/DUtils.jl)

# Installation
```julia
] add https://github.com/HetaoZ/DUtils.jl.git
```

# Usage
`showdist(A)` displays the distribution of a DArray `A`.

`showfield(A, field, inds...; axis = 0)` fetchs and displays the `field` of a DArray `A` of a self-defined datatype in the range of `inds`. The default range is all if no `inds` is provided. If the `field` is vectorial, set `axis` to display the component in the `axis`-th direction.

Examples:
```julia
julia> using Distributed

julia> addprocs(4)
4-element Array{Int64,1}:
 2
 3
 4
 5

julia> @everywhere using DistributedArrays

julia> @everywhere using DUtils

julia> b = [@spawnat pid [pid,pid*10] for pid in workers()]
4-element Array{Future,1}:
 Future(2, 1, 14, nothing)
 Future(3, 1, 15, nothing)
 Future(4, 1, 16, nothing)
 Future(5, 1, 17, nothing)

julia> a = DArray(b)
8-element DArray{Int64,1,Array{Int64,1}}:
  2
 20
  3
 30
  4
 40
  5
 50

julia> showdist(a)
PID   |  localindices
2        (1:2,)
3        (3:4,)
4        (5:6,)
5        (7:8,)
```