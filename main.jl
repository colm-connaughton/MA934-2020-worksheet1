using YAML
using Plots

# Read the config file to get the parameters
args = YAML.load(open("config.yaml"))

# Print out the arguments and their types
for key1 in keys(args)
    for key2 in keys(args[key1])
        value = args[key1][key2]
        type = typeof(value)
        println("args[", key1, "][", key2, "] = ", value, "  Type = ", type)
    end
end

n = args["group1"]["parameter1"]

# Now look at how to access functions defined in custom modules

# First, load and execute the code in MyModule.jl which defines the custom
# module MyModule
include("MyModule.jl")

# We can now call functions from MyModule by qualifying them with the module
# name:

p = MyModule.example_plot(n)
# Save the plot as a pdf file
savefig(p, "example_plot.pdf")


# If we want to access the functions exported by MyModule without
# qualifying them with the MyModule.example_plot() prefix we do the
# following. The . is important here - it tells Julia that the
# module MyModule is defined in the local namespace
using .MyModule

# We can now call example_plot() directly:
p = example_plot(n)
# Save the plot as a pdf file
savefig(p, "example_plot_again.pdf")

# Note however that since another_example_plot() has not being
# exported by MyModule, we still have to use the qualified name:

p = MyModule.another_example_plot(n)
# Save the plot as a pdf file
savefig(p, "another_example_plot.pdf")

# Check that calling another_example_plot() directly gives an error!
