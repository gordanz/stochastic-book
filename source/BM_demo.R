library(tidyverse)

# simulate a single trajectory 
# (dx = step size, nt= number of steps)

single_trajectory <- function(dx,dt) {
  dW = sample(c(-dx,dx), size=round(1/dt), replace=TRUE)
  c(0,cumsum(dW))
}

simulate_walk = function(nsim, dt, dx) {
  data.frame(t=seq(0,1,by=dt),
    replicate(nsim, single_trajectory(dx, dt))
  )
}

n=1000
tW = simulate_walk(
  nsim=20, 
  dt=1/n, 
  dx=1/sqrt(n)
)

# Plot all trajectories
W_long = pivot_longer(
  tW,!t, 
  names_to="trajectory", values_to="X")
ggplot(data=W_long, aes(x=t, y=X, color=trajectory)) +
  geom_line(size=0.2,
            # position=position_jitter(w=0.02, h=0)
            ) +
  ylim(c(-3,3))+
  theme(legend.position = "none")  


n=1000
tW = simulate_walk(
  nsim=20000, 
  dt=1/n, 
  dx=1/sqrt(n)
)

# distributions
W=data.frame(t(select(tW,-"t")))
ggplot(W, aes(x=X20))+
  geom_histogram( aes(y=..count../sum(..count..)) ,
    binwidth=1/sqrt(n))

  

