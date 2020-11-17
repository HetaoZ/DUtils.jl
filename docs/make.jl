using DUtils
using Documenter

makedocs(;
    modules=[DUtils],
    authors="Hetao Z.",
    repo="https://github.com/HetaoZ/DUtils.jl/blob/{commit}{path}#L{line}",
    sitename="DUtils.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://HetaoZ.github.io/DUtils.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/HetaoZ/DUtils.jl",
)
