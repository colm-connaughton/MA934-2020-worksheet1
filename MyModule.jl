module MyModule
# List of dependencies
using Plots

# Use the pyplot backend
pyplot()

# Set default fonts for all plots
fnt = Plots.font("DejaVu Sans", 10.0)
default(titlefont=fnt, guidefont=fnt, tickfont=fnt, legendfont=fnt)

# List of functions to be exported
# Although MyModule.jl defines two functions, we only
# export one of them so that you can see the difference
# this makes when calling the functions.
export example_plot

# Definitions of any new types provided

# Function definitions
"""
    example_plot(n)

This function evaluates Sin(x) at n points in the interval [0, 2π], creates a
    plot and then returns the plot.
"""
function example_plot(n)
    title = "This is an example plot."
    x1 = collect(range(0.0, 2*π, length=n))
    y1 = sin.(x1)

    # Plot the points
    p = plot(x1, y1, seriestype=:scatter,label="Some sample points",
    title=title, xlabel="x", ylabel="sin(x)", markersize=10, markercolor="red")

    # Now plot the true function
    x2 = collect(range(0.0, 2*π, length=1000))
    y2 = sin.(x2)
    plot!(x2, y2, label="Underlying function.", color="green", linewidth=2)
    return p
end


"""
    another_example_plot(n)

This function evaluates Cos(x) at n points in the interval [0, 2π], creates a
    plot and then returns the plot.
"""
function another_example_plot(n)
    title = "This is another example plot."
    x1 = collect(range(0.0, 2*π, length=n))
    y1 = cos.(x1)

    # Plot the points
    p = plot(x1, y1, seriestype=:scatter,label="Some sample points",
    title=title, xlabel="x", ylabel="Cos(x)", markersize=10, markercolor="red")

    # Now plot the true function
    x2 = collect(range(0.0, 2*π, length=1000))
    y2 = cos.(x2)
    plot!(x2, y2, label="Underlying function.", color="green", linewidth=2)
    return p
end
# End the module definition
end
