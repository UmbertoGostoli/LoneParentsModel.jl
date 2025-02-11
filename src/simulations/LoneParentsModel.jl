"""
    just a list of [stepping] functions to operate a Multi ABM 
    design of function arguments and return values to be specified later
""" 

module LoneParentsModel

    export createPopulation, loadData!, setSimulationParameters

    import SocialAgents: Person
    import SocialABMs: SocialABM, addProperty! 
    import SocialSimulations: SocialSimulation, setProperty!
    import Utilities: readArrayFromCSVFile


    """
        set simulation paramters @return dictionary of symbols to values
    
        All information needed by the generic SocialSimulations.run! function
        is provided here
        
        @return dictionary of required simulation parameters 
    """
    function setSimulationParameters() 
        Dict(:numRepeats=>1,
             :startYear=>1860,
             :endYear=>2040,
             :seed=> floor(Int,time()))

        #= multiprocessing params
        meta["multiprocessing"] = false
        meta["numberProcessors"] = 10
        meta["debuggingMode"] = true
        =# 

        #= Graphical interface details
        meta["interactiveGraphics"] = false
        meta["delayTime"] = 0.0
        meta["screenWidth"] = 1300
        meta["screenHeight"] = 700
        meta["bgColour"] = "black"
        meta["mainFont"] = "Helvetica 18"
        meta["fontColour"] = "white"
        meta["dateX"] = 70
        meta["dateY"] = 20
        meta["popX"] = 70
        meta["popY"] = 50
        meta["pixelsInPopPyramid"] = 2000
        meta["careLevelColour"] = ["blue","green","yellow","orange","red"]
        # ?? number of colors = number of house classes x 2
        meta["houseSizeColour"] = ["blue","green","yellow","orange","red", "lightgrey"]
        meta["pixelsPerTown"] = 56
        meta["maxTextUpdateList"] = 22
        =# 
    end 


    "Create an empty population initially with no agents"
    function createPopulation() 
        population = SocialABM{Person}()

        # ?? Brief descriptions of the numbers within the text file needed (not directly understandable in their pure format)

        # Data related to population growth 
        addProperty!(population,:fert_data,readArrayFromCSVFile("simulations/lpm/data/babyrate.txt.csv"))
        addProperty!(population,:death_female,readArrayFromCSVFile("deathrate.female.csv"))
        addProperty!(population,:death_male,readArrayFromCSVFile("deathrate.male.csv"))

        # Data related to population income 
        # addProperty!(population,:unemployment_series,readArrayFromCSVFile("unemploymentrate.csv"))
        # addProperty!(population,:income_distribution,readArrayFromCSVFile("incomeDistribution.csv"))
        # addProperty!(population,:income_percentiles,readArrayFromCSVFile("incomePercentiles.csv"))
        # addProperty!(population,:wealth_distribution,readArrayFromCSVFile("wealthDistribution.csv"))

        # shifts = createShifts() 

        population
    end


    include("lpm/InitializeLPM.jl")

    function loadData!(simulation::SocialSimulation)
        loadMetaParameters!(simulation)
        loadModelParameters!(simulation)
        initSimulationVariables(simulation)
    end 



    function doDeaths() end 
    function doAdoptions() end 
    function oneTransition_UCN() end
    function computeIncome() end 
    function updateWealthInd() end
    function jobMarket() end
    function computeAggregateSchedule() end 
    function startCareAllocation() end 
    function allocateWeeklyCare() end 
    function updateUnmetCare() end 
    function updateUnmetCareNeed() end 
    function doAgeTransition() end 
    function doSocialTransitions() end 
    function houseOwnership() end 
    function computeBenefits() end 
    function doBirths() end 
    function doDevorces() end 
    function doMarriages() end 
    function doMovingAround() end
    function selfPyramidUpdate() end
    function healthcareCost() end
    function doStats() end  

end # Module LoneParentsModel