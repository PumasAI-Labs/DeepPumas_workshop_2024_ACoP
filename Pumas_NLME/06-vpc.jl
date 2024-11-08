include("05-compare.jl")

# You can do visual predictive checks (VPC) with any fitted Pumas model
# First, use the vpc function
vpc_1cmt = vpc(fit_1cmt)
vpc_2cmt = vpc(fit_2cmt)

# Then you can plot the vpc result with vpc_plot
vplt1 = vpc_plot(
    vpc_1cmt;
    simquantile_medians = true,
    observations = false,
    include_legend = false,
    axis = (
        xlabel = "Time (h)",
        ylabel = "Concentration (ng/mL)",
        xticks = 0:50:200,
    )
)
figurelegend(vplt1, position=:b, orientation=:horizontal, nbanks=3, tellwidth=true)
vplt1

vplt2 = vpc_plot(
    vpc_2cmt;
    simquantile_medians = true,
    observations = false,
    include_legend = false,
    axis = (
        xlabel = "Time (h)",
        ylabel = "Concentration (ng/mL)",
        xticks = 0:50:200,
    )
)
figurelegend(vplt2, position=:b, orientation=:horizontal, nbanks=3, tellwidth=true)
vplt2
