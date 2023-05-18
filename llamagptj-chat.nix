{ src 
, lib
, stdenv
, fetchFromGitHub
, cmake
, glibc
}:

stdenv.mkDerivation {
  pname = "llamagptj-chat";
  version = "nightly";

  inherit src;

  #postPatch = ''
  #  substituteInPlace CMakeLists.txt \
  #    --replace 'set(CMAKE_EXE_LINKER_FLAGS "''${CMAKE_EXE_LINKER_FLAGS} -static-libgcc -static-libstdc++ -static")' \
  #      ' '
  #'';

  nativeBuildInputs = [
    cmake
  ];

  buildInputs = [
    glibc.static
  ];

  dontDisableStatic = true;

  installPhase = ''
    mkdir -p $out/bin
    cp `pwd`/bin/chat $out/bin
  '';

  cmakeFlags = [ "-DAVX512=ON" ];

  meta = with lib; {
    description = "llama-gptj chat";
    homepage = "https://github.com/kuvaus/LlamaGPTJ-chat";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}
