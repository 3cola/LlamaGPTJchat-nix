{ src 
, lib
, stdenv
, fetchFromGitHub
, cmake
}:

stdenv.mkDerivation {
  pname = "llamagptj-chat";
  version = "nightly";

  inherit src;

  postPatch = ''
    substituteInPlace CMakeLists.txt \
      --replace 'set(CMAKE_EXE_LINKER_FLAGS "''${CMAKE_EXE_LINKER_FLAGS} -static-libgcc -static-libstdc++ -static")' ""
  '';

  dontInstall = true;

  nativeBuildInputs = [
    cmake
  ];

  preBuild = ''
    mkdir build
    cd build
    cmake -DAVX512=ON ..
  '';

  cmakeFlags = [ "-DAVX512=ON" "--build" "." "--parallel" ];

  meta = with lib; {
    description = "llama-gptj chat";
    homepage = "https://github.com/kuvaus/LlamaGPTJ-chat";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}
