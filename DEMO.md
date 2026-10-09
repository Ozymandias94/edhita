# Recording takes: Customer.io Data In demo

`demo-baseline` is `master` plus only a working `Constants.swift` and a gitignore entry for the
local key file. It contains no Customer.io code. Each take has Claude add the integration.

## One-time setup (before filming)
1. Install Xcode and an iPhone simulator runtime. Open `Edhita.xcodeproj` once and build (▶) so
   packages and caches are warm. Do this on `demo-run`, then run `bin/demo-reset.sh` again.
2. Create the key file, next to `Edhita.xcodeproj`. It is gitignored, so resets never delete it:
   `echo 'CIO_CDP_WRITE_KEY = <your CDP source write key>' > CustomerIO.local.xcconfig`
   Keep this file and the Terminal off camera.

## Before each take
1. Close Xcode (Cmd+Q).
2. Run `bin/demo-reset.sh` from the repo folder.
3. In Customer.io, delete the `edhita-demo-user` person so the new events stand out.
4. Reopen `Edhita.xcodeproj`, choose an iPhone simulator.

## Take
1. Give Claude the Customer.io prompt (it edits this folder; no push or pull needed).
2. Press ▶ in Xcode. In the app: `+` -> File -> name it (new name each take) -> Save.
3. In Customer.io, open the iOS source events and People -> `edhita-demo-user`.
