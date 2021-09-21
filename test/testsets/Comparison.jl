# MIT license
# Copyright (c) Microsoft Corporation. All rights reserved.
# See LICENSE in the project root for full license information.

@testset "Comparison" begin
    @testset "Refraction" begin
        λ = 0.550
        r1 = OpticalRay([0.0, 0.0, 1.0], [0.0, 0.0, -1.0], 1.0, λ)
        r2 = OpticalRay([2.0, 2.0, 1.0], [0.0, 0.0, -1.0], 1.0, λ)
        r3 = OpticalRay([5.0, 5.0, 1.0], [0.0, 0.0, -1.0], 1.0, λ)
        r4 = OpticalRay([0.0, -5.0, 1.0], [0.0, 0.08715574274765818, -0.9961946980917454], 1.0, λ)
        r5 = OpticalRay([-5.0, -5.0, 1.0], [0.08715574274765818, -0.01738599476176408, -0.9960429728140486], 1.0, λ)

        # Test a number of rays under standard environmental conditions
        a = TestData.planoplano()
        res = trace(a, r1, test = true)
        @test isapprox(point(res), [0.0, 0.0, -67.8], rtol = COMP_TOLERANCE)
        @test isapprox(pathlength(res), 73.9852238762079, rtol = COMP_TOLERANCE)
        res = trace(a, r2, test = true)
        @test isapprox(point(res), [2.0, 2.0, -67.8], rtol = COMP_TOLERANCE)
        @test isapprox(pathlength(res), 73.9852238762079, rtol = COMP_TOLERANCE)
        res = trace(a, r3, test = true)
        @test isapprox(point(res), [5.0, 5.0, -67.8], rtol = COMP_TOLERANCE)
        @test isapprox(pathlength(res), 73.9852238762079, rtol = COMP_TOLERANCE)
        res = trace(a, r4, test = true)
        @test isapprox(point(res), [0.0, 0.7192321011619232, -67.8], rtol = COMP_TOLERANCE)
        @test isapprox(pathlength(res), 74.234903851062, rtol = COMP_TOLERANCE)
        res = trace(a, r5, test = true)
        @test isapprox(point(res), [0.7200535362928893, -6.141047252697188, -67.8], rtol = COMP_TOLERANCE)
        @test isapprox(pathlength(res), 74.2448952769065, rtol = COMP_TOLERANCE)

        a = TestData.concaveplano()
        res = trace(a, r1, test = true)
        @test isapprox(point(res), [0.0, 0.0, -67.8], rtol = COMP_TOLERANCE)
        @test isapprox(pathlength(res), 73.9852238762079, rtol = COMP_TOLERANCE)
        res = trace(a, r2, test = true)
        @test isapprox(point(res), [3.633723967570758, 3.633723967570758, -67.8], rtol = COMP_TOLERANCE)
        @test isapprox(pathlength(res), 74.0772722321026, rtol = COMP_TOLERANCE)
        res = trace(a, r3, test = true)
        @test isapprox(point(res), [9.153654757938119, 9.153654757938119, -67.8], rtol = COMP_TOLERANCE)
        @test isapprox(pathlength(res), 74.5695599263722, rtol = COMP_TOLERANCE)
        res = trace(a, r4, test = true)
        @test isapprox(point(res), [0.0, -3.401152468994745, -67.8], rtol = COMP_TOLERANCE)
        @test isapprox(pathlength(res), 74.1609946836496, rtol = COMP_TOLERANCE)
        res = trace(a, r5, test = true)
        @test isapprox(point(res), [-3.457199906282556, -10.32836827735406, -67.8], rtol = COMP_TOLERANCE)
        @test isapprox(pathlength(res), 74.5393056652617, rtol = COMP_TOLERANCE)

        a = TestData.doubleconcave()
        res = trace(a, r1, test = true)
        @test isapprox(point(res), [0.0, 0.0, -67.8], rtol = COMP_TOLERANCE)
        @test isapprox(pathlength(res), 73.9852238762079, rtol = COMP_TOLERANCE)
        res = trace(a, r2, test = true)
        @test isapprox(point(res), [5.235579681684886, 5.235579681684886, -67.8], rtol = COMP_TOLERANCE)
        @test isapprox(pathlength(res), 74.2624909340242, rtol = COMP_TOLERANCE)
        res = trace(a, r3, test = true)
        @test isapprox(point(res), [13.42351905137007, 13.42351905137007, -67.8], rtol = COMP_TOLERANCE)
        @test isapprox(pathlength(res), 75.8131310483928, rtol = COMP_TOLERANCE)
        res = trace(a, r4, test = true)
        @test isapprox(point(res), [0.0, -6.904467939352202, -67.8], rtol = COMP_TOLERANCE)
        @test isapprox(pathlength(res), 74.3286918571586, rtol = COMP_TOLERANCE)
        res = trace(a, r5, test = true)
        @test isapprox(point(res), [-7.089764102262856, -14.61837033417989, -67.8], rtol = COMP_TOLERANCE)
        @test isapprox(pathlength(res), 75.4286280772859, rtol = COMP_TOLERANCE)

        a = TestData.convexplano()
        res = trace(a, r1, test = true)
        @test isapprox(point(res), [0.0, 0.0, -67.8], rtol = COMP_TOLERANCE)
        @test isapprox(pathlength(res), 73.9852238762079, rtol = COMP_TOLERANCE)
        res = trace(a, r2, test = true)
        @test isapprox(point(res), [0.8867891519368289, 0.8867891519368289, -67.8], rtol = COMP_TOLERANCE)
        @test isapprox(pathlength(res), 73.9698941263224, rtol = COMP_TOLERANCE)
        res = trace(a, r3, test = true)
        @test isapprox(point(res), [2.212067233969831, 2.212067233969831, -67.8], rtol = COMP_TOLERANCE)
        @test isapprox(pathlength(res), 73.8895474037682, rtol = COMP_TOLERANCE)
        res = trace(a, r4, test = true)
        @test isapprox(point(res), [0.0, 3.489759589087602, -67.8], rtol = COMP_TOLERANCE)
        @test isapprox(pathlength(res), 74.4310036252394, rtol = COMP_TOLERANCE)
        res = trace(a, r5, test = true)
        @test isapprox(point(res), [3.491858246934857, -3.331802834115089, -67.8], rtol = COMP_TOLERANCE)
        @test isapprox(pathlength(res), 74.344370622227, rtol = COMP_TOLERANCE)

        a = TestData.doubleconvex()
        res = trace(a, r1, test = true)
        @test isapprox(point(res), [0.0, 0.0, -67.8], rtol = COMP_TOLERANCE)
        @test isapprox(pathlength(res), 73.9852238762079, rtol = COMP_TOLERANCE)
        res = trace(a, r2, test = true)
        @test isapprox(point(res), [-0.06191521590711035, -0.06191521590711035, -67.8], rtol = COMP_TOLERANCE)
        @test isapprox(pathlength(res), 73.987421926598, rtol = COMP_TOLERANCE)
        res = trace(a, r3, test = true)
        @test isapprox(point(res), [-0.2491105067897657, -0.2491105067897657, -67.8], rtol = COMP_TOLERANCE)
        @test isapprox(pathlength(res), 74.0110871422915, rtol = COMP_TOLERANCE)
        res = trace(a, r4, test = true)
        @test isapprox(point(res), [0.0, 5.639876913179362, -67.8], rtol = COMP_TOLERANCE)
        @test isapprox(pathlength(res), 74.6758349889372, rtol = COMP_TOLERANCE)
        res = trace(a, r5, test = true)
        @test isapprox(point(res), [5.705452331562673, -0.7679713587894854, -67.8], rtol = COMP_TOLERANCE)
        @test isapprox(pathlength(res), 74.6175821043825, rtol = COMP_TOLERANCE)
    end # testset Refraction

    @testset "Temperature/Pressure" begin
        λ = 0.550
        r1 = OpticalRay([0.0, 0.0, 1.0], [0.0, 0.0, -1.0], 1.0, λ)
        r2 = OpticalRay([2.0, 2.0, 1.0], [0.0, 0.0, -1.0], 1.0, λ)
        r3 = OpticalRay([5.0, 5.0, 1.0], [0.0, 0.0, -1.0], 1.0, λ)
        r4 = OpticalRay([0.0, -5.0, 1.0], [0.0, 0.08715574274765818, -0.9961946980917454], 1.0, λ)
        r5 = OpticalRay([-5.0, -5.0, 1.0], [0.08715574274765818, -0.01738599476176408, -0.9960429728140486], 1.0, λ)

        # Test a component whose material does have a ΔT component
        a = TestData.doubleconvex(temperature = 40 * u"°C")
        @test isapprox(point(intersection(trace(a, r1, test = true))), [0.0, 0.0, -67.8], rtol = COMP_TOLERANCE)
        @test isapprox(point(intersection(trace(a, r2, test = true))), [-0.06214282132053373, -0.06214282132053373, -67.8], rtol = COMP_TOLERANCE)
        @test isapprox(point(intersection(trace(a, r3, test = true))), [-0.2497005807710933, -0.2497005807710933, -67.8], rtol = COMP_TOLERANCE)
        @test isapprox(point(intersection(trace(a, r4, test = true))), [0.0, 5.640416741927821, -67.8], rtol = COMP_TOLERANCE)
        @test isapprox(point(intersection(trace(a, r5, test = true))), [5.706006107804734, -0.7673622008537766, -67.8], rtol = COMP_TOLERANCE)

        # note that this material doesn't have a ΔT component
        λ2 = 0.533
        r1 = OpticalRay([0.0, 0.0, 1.0], [0.0, 0.0, -1.0], 1.0, λ2)
        r2 = OpticalRay([2.0, 2.0, 1.0], [0.0, 0.0, -1.0], 1.0, λ2)
        r3 = OpticalRay([5.0, 5.0, 1.0], [0.0, 0.0, -1.0], 1.0, λ2)
        r4 = OpticalRay([0.0, -5.0, 1.0], [0.0, 0.08715574274765818, -0.9961946980917454], 1.0, λ2)
        r5 = OpticalRay([-5.0, -5.0, 1.0], [0.08715574274765818, -0.01738599476176408, -0.9960429728140486], 1.0, λ2)
    end # testset Temperature/Pressure

    @testset "Reflection" begin
        λ = 0.550
        r1 = OpticalRay([0.0, 0.0, 1.0], [0.0, 0.0, -1.0], 1.0, λ)
        r2 = OpticalRay([2.0, 2.0, 1.0], [0.0, 0.0, -1.0], 1.0, λ)
        r3 = OpticalRay([5.0, 5.0, 1.0], [0.0, 0.0, -1.0], 1.0, λ)
        r4 = OpticalRay([0.0, -5.0, 1.0], [0.0, 0.08715574274765818, -0.9961946980917454], 1.0, λ)
        r5 = OpticalRay([-5.0, -5.0, 1.0], [0.08715574274765818, -0.01738599476176408, -0.9960429728140486], 1.0, λ)

        a = TestData.planoconcaverefl()
        res = trace(a, r1, test = true)
        @test isapprox(point(res), [0.0, 0.0, 47.8], rtol = COMP_TOLERANCE)
        @test isapprox(pathlength(res), 79.1704477524159, rtol = COMP_TOLERANCE)
        res = trace(a, r2, test = true)
        @test isapprox(point(res), [-6.19723306038804, -6.19723306038804, 47.8], rtol = COMP_TOLERANCE)
        @test isapprox(pathlength(res), 80.0979229417755, rtol = COMP_TOLERANCE)
        res = trace(a, r3, test = true)
        @test isapprox(point(res), [-17.7546255175372, -17.7546255175372, 47.8], rtol = COMP_TOLERANCE)
        @test isapprox(pathlength(res), 86.2063094599075, rtol = COMP_TOLERANCE)
        res = trace(a, r4, test = true)
        @test isapprox(point(res), [0.0, 19.5349836031196, 47.8], rtol = COMP_TOLERANCE)
        @test isapprox(pathlength(res), 83.5364646376395, rtol = COMP_TOLERANCE)
        res = trace(a, r5, test = true)
        @test isapprox(point(res), [21.2477706541112, 17.3463704045055, 47.8], rtol = COMP_TOLERANCE)
        @test isapprox(pathlength(res), 87.4033932087711, rtol = COMP_TOLERANCE)
    end # testset Reflection

    @testset "Complex Lenses" begin
        λ = 0.550
        r1 = OpticalRay([0.0, 0.0, 1.0], [0.0, 0.0, -1.0], 1.0, λ)
        r2 = OpticalRay([2.0, 2.0, 1.0], [0.0, 0.0, -1.0], 1.0, λ)
        r3 = OpticalRay([5.0, 5.0, 1.0], [0.0, 0.0, -1.0], 1.0, λ)
        r4 = OpticalRay([0.0, -5.0, 1.0], [0.0, 0.08715574274765818, -0.9961946980917454], 1.0, λ)
        r5 = OpticalRay([-5.0, -5.0, 1.0], [0.08715574274765818, -0.01738599476176408, -0.9960429728140486], 1.0, λ)

        @testset "conicsystemZ" begin
            a = TestData.conicsystemZ()
            res = trace(a, r1, test = true)
            @test isapprox(point(res), [0.0, 0.0, -67.8], rtol = COMP_TOLERANCE)
            @test isapprox(pathlength(res), 73.9852238762079, rtol = COMP_TOLERANCE)
            res = trace(a, r2, test = true)
            @test isapprox(point(res), [-1.80279270185495, -1.80279270185495, -67.8], rtol = COMP_TOLERANCE)
            @test isapprox(pathlength(res), 74.1000975813922, rtol = COMP_TOLERANCE)
            res = trace(a, r3, test = true)
            @test isapprox(point(res), [-2.8229241607807, -2.8229241607807, -67.8], rtol = COMP_TOLERANCE)
            @test isapprox(pathlength(res), 74.282094499601, rtol = COMP_TOLERANCE)
            res = trace(a, r4, test = true)
            @test isapprox(point(res), [0.0, 9.01421545841289, -67.8], rtol = COMP_TOLERANCE)
            @test isapprox(pathlength(res), 75.2211078071893, rtol = COMP_TOLERANCE)
            res = trace(a, r5, test = true)
            @test isapprox(point(res), [8.13946939328266, 2.23006981338816, -67.8], rtol = COMP_TOLERANCE)
            @test isapprox(pathlength(res), 75.1025133542546, rtol = COMP_TOLERANCE)
        end

        @testset "asphericsystem" begin
            a = TestData.asphericsystem()
            res = trace(a, r1, test = true)
            @test isapprox(point(res), [0.0, 0.0, -67.8], rtol = COMP_TOLERANCE)
            @test isapprox(pathlength(res), 73.9852238762079, rtol = COMP_TOLERANCE)
            res = trace(a, r2, test = true)
            @test isapprox(point(res), [0.0735282671574837, 0.0735282671574837, -67.8], rtol = COMP_TOLERANCE)
            @test isapprox(pathlength(res), 74.0161411455851, rtol = COMP_TOLERANCE)
            track = Vector{OpticSim.LensTrace{Float64,3}}(undef, 0)
            res = trace(a, r3, test = true, trackrays = track)
            @test (res === nothing) # TIR
            @test isapprox(point(track[end]), [-5.0, -5.0, 0.0], rtol = COMP_TOLERANCE)
            @test isapprox(pathlength(track[end]), 46.5556716286238, rtol = COMP_TOLERANCE)
            res = trace(a, r4, test = true)
            @test isapprox(point(res), [0.0, 11.9748998399885, -67.8], rtol = COMP_TOLERANCE)
            @test isapprox(pathlength(res), 76.0760286320348, rtol = COMP_TOLERANCE)
            track = Vector{OpticSim.LensTrace{Float64,3}}(undef, 0)
            res = trace(a, r5, test = true, trackrays = track)
            @test (res === nothing) # TIR
            @test isapprox(point(track[end]), [5.49905367197174, 5.66882664623822, 0.0], rtol = COMP_TOLERANCE)
            @test isapprox(pathlength(track[end]), 47.6825931025333, rtol = COMP_TOLERANCE)
        end

        @testset "zernikesystem" begin
            a = TestData.zernikesystem()
            res = trace(a, r1, test = true)
            @test isapprox(point(res), [0.0, -8.9787010034042, -67.8], rtol = COMP_TOLERANCE)
            @test isapprox(pathlength(res), 75.5977029819277, rtol = COMP_TOLERANCE)
            res = trace(a, r2, test = true)
            @test isapprox(point(res), [-1.58696749235066, -9.71313213852721, -67.8], rtol = COMP_TOLERANCE)
            @test isapprox(pathlength(res), 75.7603266537023, rtol = COMP_TOLERANCE)
            res = trace(a, r3, test = true)
            @test isapprox(point(res), [0.790348081563859, -0.762155123619682, -67.8], rtol = COMP_TOLERANCE)
            @test isapprox(pathlength(res), 74.1933359669848, rtol = COMP_TOLERANCE)
            res = trace(a, r4, test = true)
            @test isapprox(point(res), [0.0, 10.0037899692172, -67.8], rtol = COMP_TOLERANCE)
            @test isapprox(pathlength(res), 76.8041236301678, rtol = COMP_TOLERANCE)
            res = trace(a, r5, test = true)
            @test isapprox(point(res), [35.5152289731456, 28.3819941055557, -67.8], rtol = COMP_TOLERANCE)
            @test isapprox(pathlength(res), 94.3059947823954, rtol = COMP_TOLERANCE)
        end

        @testset "conicsystemQ" begin
            a = TestData.conicsystemQ()
            res = trace(a, r1, test = true)
            @test isapprox(point(res), [0.0, 0.0, -67.8], rtol = COMP_TOLERANCE)
            @test isapprox(pathlength(res), 73.9852238762079, rtol = COMP_TOLERANCE)
            res = trace(a, r2, test = true)
            @test isapprox(point(res), [-1.80279270185495, -1.80279270185495, -67.8], rtol = COMP_TOLERANCE)
            @test isapprox(pathlength(res), 74.1000975813922, rtol = COMP_TOLERANCE)
            res = trace(a, r3, test = true)
            @test isapprox(point(res), [-2.8229241607807, -2.8229241607807, -67.8], rtol = COMP_TOLERANCE)
            @test isapprox(pathlength(res), 74.282094499601, rtol = COMP_TOLERANCE)
            res = trace(a, r4, test = true)
            @test isapprox(point(res), [0.0, 9.01421545841289, -67.8], rtol = COMP_TOLERANCE)
            @test isapprox(pathlength(res), 75.2211078071893, rtol = COMP_TOLERANCE)
            res = trace(a, r5, test = true)
            @test isapprox(point(res), [8.13946939328266, 2.23006981338816, -67.8], rtol = COMP_TOLERANCE)
            @test isapprox(pathlength(res), 75.1025133542546, rtol = COMP_TOLERANCE)
        end

        @testset "qtypesystem" begin
            # No NSC qtype so have less precise SC values and no angled rays
            a = TestData.qtypesystem()
            res = trace(a, r1, test = true)
            @test isapprox(point(res), [-4.3551074306, -0.318112811010, -67.8], rtol = 1e-12)
            # TODO these are the values that I get for comparison - I'm pretty certain that they are just wrong...
            # res = trace(a, r2, test = true)
            # @test isapprox(point(res), [-0.091773202667, 3.9362695851, -67.8], rtol = 1e-12)
            # res = trace(a, r3, test = true)
            # @test isapprox(point(res), [-7.0993098547, -2.6848726242, -67.8], rtol = 1e-12)
        end

        @testset "chebyshevsystem" begin
            # No NSC chebyshev so have less precise SC values and no angled rays
            a = TestData.chebyshevsystem()
            res = trace(a, r1, test = true)
            @test isapprox(point(res), [-1.07963031980, 0.53981515992, -67.8], rtol = 1e-12)
            res = trace(a, r2, test = true)
            @test isapprox(point(res), [0.00851939011, 1.25870229260, -67.8], rtol = 1e-12)
            res = trace(a, r3, test = true)
            @test isapprox(point(res), [-1.20441411240, -0.07554605390, -67.8], rtol = 1e-12)
        end

        @testset "gridsagsystem" begin
            a = TestData.gridsagsystem()
            res = trace(a, r1, test = true)
            @test isapprox(point(res), [21.0407756733608, 21.724638830759, -67.8], rtol = COMP_TOLERANCE)
            @test isapprox(pathlength(res), 82.0777022031378, rtol = COMP_TOLERANCE)
            res = trace(a, r2, test = true)
            @test isapprox(point(res), [-0.489183765274452, 0.405160352533666, -67.8], rtol = COMP_TOLERANCE)
            @test isapprox(pathlength(res), 75.536902213118, rtol = COMP_TOLERANCE)
            res = trace(a, r3, test = true)
            @test isapprox(point(res), [-12.0770793886528, -8.7705340321259, -67.8], rtol = COMP_TOLERANCE)
            @test isapprox(pathlength(res), 77.5651917266687, rtol = COMP_TOLERANCE)
            res = trace(a, r4, test = true)
            @test isapprox(point(res), [-1.20535362019229, 6.07973526939659, -67.8], rtol = COMP_TOLERANCE)
            @test isapprox(pathlength(res), 74.7349148204077, rtol = COMP_TOLERANCE)
            res = trace(a, r5, test = true)
            @test isapprox(point(res), [6.5112407340601, -0.22055440245024, -67.8], rtol = COMP_TOLERANCE)
            @test isapprox(pathlength(res), 74.6955888563913, rtol = COMP_TOLERANCE)
        end
    end #testset complex lenses

    # @testset "Power" begin
    #     λ = 0.550
    #     r1 = OpticalRay([0.0, 0.0, 1.0], [0.0, 0.0, -1.0], 1.0, λ)
    #     r2 = OpticalRay([2.0, 2.0, 1.0], [0.0, 0.0, -1.0], 1.0, λ)
    #     r3 = OpticalRay([5.0, 5.0, 1.0], [0.0, 0.0, -1.0], 1.0, λ)
    #     a = TestData.doubleconvex()
    #     res = trace(a, r1, test = true)
    #     @test isapprox(power(res), 0.915508396)
    #     res = trace(a, r2, test = true)
    #     @test isapprox(power(res), 0.915526077)
    #     res = trace(a, r3, test = true)
    #     @test isapprox(power(res), 0.915577586)
    # end
end # testset Comparison
