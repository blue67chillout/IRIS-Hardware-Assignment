The circuit is designed for 4 bits ,however if we want to extend it to n bits and have shifting of #1 we would need N muxes
However to have shift range (0,N-1),we would need nlogn muxes 

For the circuitverse dsign

Control signals are:
  00:no shift
  01:ROR#1
  10:ROR#2
  11:ROR#3
