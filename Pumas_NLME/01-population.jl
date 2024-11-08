using DeepPumas
using CairoMakie
using PharmaDatasets
# Set a nice plotting theme. There's also `deep_dark()`.
set_theme!(deep_light()) 

pkdata = dataset("nlme_sample")

# check that we have the standard NM-TRAN column names such as
# - id
# - time
# - dv
# - amt
# - evid
# - cmt
# - rate
# We also have a covariates AGE and SEX
pop = read_pumas(
    pkdata;
    id = :ID,
    time = :TIME,
    amt = :AMT,
    covariates = [:AGE, :SEX],
    observations = [:DV],
    cmt = :CMT,
    evid = :EVID,
    rate = :RATE,
)

# The function that parses data into a Population is read_pumas
# Check the docstring with ?read_pumas in your Julia REPL
# Specifically, the keyword arguments

#?read_pumas

# Now let's read our DataFrame into a Population with read_pumas

# A Population is simply a vector of Subjects
pop[1]

# You can also slice it same as with any vector
pop[5:10]
pop[begin:30]
pop[80:end]

# We can also convert back to a NM-TRAN DataFrame by using the DataFrame constructor
reconstructed_pkdata = DataFrame(pop)

# Or a single Subject of the Population
reconstructed_subject = DataFrame(pop[1])

# And, we can plot the individual timecourses. Slicing is useful to avoid getting too many
# subplots at once.
plotgrid(pop[1:12])
