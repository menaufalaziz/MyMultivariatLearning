using CSV, DataFrames, Plots, Distributions, StatsPlots

df = CSV.read("company_financials.csv", DataFrame)

x1 = df[!, 2]
x2 = df[!, 3]

layout = @layout [a _ b{0.8w, 0.8h} c]
print(df)

# Plotting x1 and x2
p3 = scatter(x1, x2, grid=false, legend=false)

@df df marginalhist(:x1_sales, :x2_profits)


var(x1)
cor(x1,x2)


df = CSV.read("air_pollution_data.csv", DataFrame)
namaKolom = names(df)

X = Matrix(df[:, 1:length(namaKolom)])

xbar = vec(mean(X, dims=1))

X_centered = X .- mean(X, dims=1)
Sn = (X_centered' * X_centered) / size(X, 1)

cor(X)


@df df marginalhist(:Wind_x1, :Solar_radiation_x2, :CO_x3, :NO_x4, :NO2_x5, :O3_x6, :HC_x7)

xbar = Vector{Float64}()
for i in 1 : length(namaKolom) 
  rata2 = mean(df[!, i])
  print("x", i, " = " ,rata2, "\n")
  append!(xbar, rata2)
end

plotly()
v1 = [2, 3, 4]   # variable 1 as a vector across items 1,2,3
v2 = [1, 2, 4]   # variable 2 as a vector across items 1,2,3

plot3d([0, v1[1]], [0, v1[2]], [0, v1[3]], label="Variable 1", lw=3, arrow=true)
plot3d!([0, v2[1]], [0, v2[2]], [0, v2[3]], label="Variable 2", lw=3, arrow=true)
scatter3d!([v1[1]], [v1[2]], [v1[3]], label="", color=:blue, ms=5)
scatter3d!([v2[1]], [v2[2]], [v2[3]], label="", color=:red, ms=5)

xlabel!("Item 1"); ylabel!("Item 2"); zlabel!("Item 3")
title!("Item Space (each vector = one variable)")
