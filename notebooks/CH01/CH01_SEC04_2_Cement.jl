### A Pluto.jl notebook ###
# v0.19.27

using Markdown
using InteractiveUtils

# ╔═╡ 58fdf9e2-8dc6-43e2-9798-8e992dac2053
begin
	using PlutoUI, LinearAlgebra
	using Plots, LaTeXStrings, CSVFiles, DataFrames, CSV
end

# ╔═╡ 719af058-3505-4ede-be04-557a448d8ade
html"""
<div class="banner-background">
</div>

<div class="nb-intro">
	<div class="header-box"> 
		<p class="nb-intro-header"> Chapter 1.4 </p>
		<p class="nb-intro-title"> Cement Mixtures </p>
		<p style="text-align:center;"> 
			<img src="https://github.com/RayleighLord/DataDrivenScienceBook.jl/blob/main/data/svd_overview.png?raw=true" alt="SVD"
			width="35%"
			class="logo">
		</p>
	</div>
</div>

<style>

.banner-background {
	position: absolute;
	top: -550px;
	left: -40vw;
	height: 550px;
	width: 150vw;
	background-color: #212529;
	opacity: 1;
}

.nb-intro {
	position: absolute;
	top: -550px;
	left: -8px;
	height: 550px;
	width: calc(100% + 8px);
	background-image: #212529;
}

.header-box {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	gap: 20px;

	height: 500px;
	margin-top: 20px;
	padding: 0px 10px 0px 10px;
	border: 5px solid #adb5bd;
	border-radius: 50px;
	box-shadow: 0px 5px 20px rgba(255, 255, 255, 0.25);
	text-align: center;
	position: relative;
	transition: all 0.3s;
}

.header-box:hover {
	transform: translateY(-5px);	
	box-shadow: 0px 10px 30px rgba(255, 255, 255, 0.3);
}

.nb-intro-header {
	margin: 0;
	color: #adb5bd;
	font-family: Vollkorn, serif;
	font-size: 32px;
	font-weight: 500;
	font-feature-settings: 'lnum', 'pnum';
}

.nb-intro-title {
	margin: 0;
	margin-bottom: 15px;
	color: #f1f3f5;
	font-family: Vollkorn, serif;
	font-size: 50px;
	font-weight: 600;
	font-feature-settings: 'lnum', 'pnum';
	line-height: 1.2;
}

body {
	overflow-x: hidden;
	box-sizing: border-box;
}

pluto-cell:first-child {
	margin-top: 550px;
}

main preamble {
    height: 0px;
    margin: 0px;
    padding: 0px;
}

input[type=range] {
  width: 60%;
}

</style>
"""

# ╔═╡ 0fe1f53b-4929-4915-b0d9-c3e7fc4e4926
md"""
# Cement Mixtures Example
"""

# ╔═╡ db4935fc-eaf7-48d2-b580-1340531ce204
A = load("https://raw.githubusercontent.com/RayleighLord/DataDrivenScienceBook.jl/main/data/hald_ingredients.csv"; header_exists = false) |> DataFrame |> Matrix

# ╔═╡ 67920869-dfc5-4353-8f2e-229df81c9e23
b = load("https://raw.githubusercontent.com/RayleighLord/DataDrivenScienceBook.jl/main/data/hald_heat.csv"; header_exists = false) |> DataFrame |> Matrix

# ╔═╡ c443408c-c678-4314-b708-d2d29fdd1295
begin
	U, Σ, V = svd(A)
	x = V * (diagm(Σ) \ (U' * b))
end

# ╔═╡ 12ef393a-e557-4147-a4f3-a99a6e21140e
begin
	plot(0:length(b)-1, b; 
	label = L"\mathrm{Heat \ data}", xlims = (0, 12), ylims = (70, 120),
	legend = :topleft, color = :black,
	xlabel = L"\mathrm{Mixture}", ylabel = L"\mathrm{Heat} \ [\mathrm{cal/g}]")
	plot!(0:length(b)-1, A * x; label = L"\mathrm{Regression}", marker = (:circle, 5), color = :salmon)
end

# ╔═╡ edf38dfa-40f9-412a-8d7c-114ba7a0ba2d
theme(
	:default;
	size = (600, 500),
	legend = true,
	legendfontsize = 12,
	xtickfontsize = 12,
	ytickfontsize = 12,
	ylabelfontsize = 16,
	xlabelfontsize = 16,
	linewidth = 3
)

# ╔═╡ Cell order:
# ╟─719af058-3505-4ede-be04-557a448d8ade
# ╠═58fdf9e2-8dc6-43e2-9798-8e992dac2053
# ╟─0fe1f53b-4929-4915-b0d9-c3e7fc4e4926
# ╠═db4935fc-eaf7-48d2-b580-1340531ce204
# ╠═67920869-dfc5-4353-8f2e-229df81c9e23
# ╠═c443408c-c678-4314-b708-d2d29fdd1295
# ╠═12ef393a-e557-4147-a4f3-a99a6e21140e
# ╠═edf38dfa-40f9-412a-8d7c-114ba7a0ba2d
