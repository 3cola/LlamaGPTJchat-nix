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

  #postPatch = ''
  #  substituteInPlace CMakeLists.txt \
  #    --replace 'set(CMAKE_INSTALL_PREFIX ''${CMAKE_BINARY_DIR}/install)' ""
  #'';

  nativeBuildInputs = [
    cmake
  ];

  cmakeFlags = [];

  setSourceRoot = "sourceRoot=`pwd`/source/llamagptj-chat";

  meta = with lib; {
    description = "llama-gptj chat";
    homepage = "https://github.com/kuvaus/LlamaGPTJ-chat";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}
