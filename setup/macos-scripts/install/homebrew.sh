# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo >> /Users/johnreienriquez/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/johnreienriquez/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
