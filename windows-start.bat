del %TEMP%\rust /Q
docker pull ssmay0/chiron-rust-client
mkdir %TEMP%\rust
docker run -d -p 8080:8080 -v %TEMP%\rust:/host ssmay0/chiron-rust-client
start "" "http://localhost:8080"
code %TEMP%/rust