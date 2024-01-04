# canal
Lightspark wallet geared towards retail remittance flows.


# firebase 
Local Emulators

first run:
`firebase emulators:start --export-on-exit=./seed`

subsequent runs:
`firebase emulators:start --import=./seed`

# riverpod code generation
in its own terminal run:

`dart run build_runner watch`

then use the `@Riverpod` decorator on a top-level function and `part < repository >.g.dart;` to generate the provider code.