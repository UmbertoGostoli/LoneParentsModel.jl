"""
Definition of a social simulation type
""" 

export SocialSimulation 
import SocialABMs: SocialABM

mutable struct SocialSimulation <: AbstractSocialSimulation  
    model::SocialABM
    properties::Dict{Symbol,Any}
    SocialSimulation(createABM::Function,properties::Dict{Symbol}) = new(createABM(),copy(properties))
end 

