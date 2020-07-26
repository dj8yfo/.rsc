sudo apt-get install -y curl \
    gnupg ca-certificates git \
    gcc-multilib g++-multilib cmake libssl-dev pkg-config \
    libfreetype6-dev libasound2-dev libexpat1-dev libxcb-composite0-dev \
    libbz2-dev libsndio-dev freeglut3-dev libxmu-dev libxi-dev
curl -sL "http://packages.lunarg.com/lunarg-signing-key-pub.asc" | sudo apt-key add -
sudo curl -sLo "/etc/apt/sources.list.d/lunarg-vulkan-1.2.131-bionic.list" "http://packages.lunarg.com/vulkan/1.2.131/lunarg-vulkan-1.2.131-bionic.list"
sudo apt-get update -y
sudo apt-get install -y vulkan-sdk
#curl --proto '=https' --tlsv1.2 -sSf "https://sh.rustup.rs" | sh
git clone "https://github.com/Kethku/neovide"
cd neovide && ~/.cargo/bin/cargo build --release
sudo cp ./target/release/neovide /usr/local/bin/
sudo apt install -y mesa-vulkan-drivers
