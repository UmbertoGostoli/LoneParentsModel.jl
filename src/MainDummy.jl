"""
An example of a dummy simulation of an ABM model.

The ABM model corresponds to a population of agents. 
Some agents are living together in a house.
They are currently ageing together. 

to run this script, LoneParentsModel.jl package has to
be in the load path. Within REPL, execute:

julia> push!(LOAD_PATH,"/path/to/LoneParentsModel.jl/src")
julia> include("this_script.jl")
""" 


using SocialSimulations: SocialSimulation, run! 
using SocialABMs: SocialABM, dummystep, population_step!

import SocialSimulations.Dummy: createPopulation, loadData!


dummySimulation = SocialSimulation(createPopulation,
                                   Dict(:startTime=>1990,
                                        :finishTime=>2030,
                                        :dt=>1,
                                        :seed=>floor(Int,time())))

loadData!(dummySimulation)

run!(dummySimulation,dummystep,population_step!)
 

# This could return a list of elemantry ABMs (ABMsList) 
# (towns,houses,population) =
#    SocialDummySimulation.initDummyABMs() 

# Create a MultiABM 
# 
# After a Multi ABM has been initialized run the simulation 
# e.g.
# createMultiABM(ABMsList) 
# 

# SocialDummySimulation.runDummyExample(population)


