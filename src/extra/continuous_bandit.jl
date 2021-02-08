struct ContinuousBanditMDP <: MDP{Float32, Float32}
    goal::Float32
end

POMDPs.gen(mdp::ContinuousBanditMDP, s, a, rng::AbstractRNG = Random.GLOBAL_RNG) = (sp = a[1], r = -(a[1] - mdp.goal)^2)
POMDPs.initialstate(mdp::ContinuousBanditMDP, rng::AbstractRNG = Random.GLOBAL_RNG) = Deterministic(0f0)
POMDPs.isterminal(mdp::ContinuousBanditMDP, s) = false
POMDPs.discount(mdp::ContinuousBanditMDP) = 0.99
POMDPs.convert_s(::Type{V}, s::Float32, mdp::ContinuousBanditMDP) where {V<:AbstractArray} = [s]
