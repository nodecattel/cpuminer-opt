# cpuminer-opt Setup and Usage Guide

This guide will walk you through the steps to clone the repository, compile the cpuminer-opt binary, and start mining using the `mine.sh` script.

## 1. Cloning the Repository

First, you need to clone the cpuminer-opt repository to your local machine:

```bash
git clone https://github.com/nodecattel/cpuminer-opt.git
cd cpuminer-opt

Here’s the complete `README.md` file formatted as you requested:

```markdown
# cpuminer-opt Setup and Usage Guide

This guide will walk you through the steps to clone the repository, compile the cpuminer-opt binary, and start mining using the `mine.sh` script.

## 1. Cloning the Repository

First, you need to clone the cpuminer-opt repository to your local machine:

```bash
git clone https://github.com/nodecattel/cpuminer-opt.git
cd cpuminer-opt
```

## 2. Compiling the Binary

Once the repository is cloned, you can compile the cpuminer-opt binary using the provided `minerinit.sh` script:

```bash
chmod +x minerinit.sh
./minerinit.sh
```

The `minerinit.sh` script will install the necessary dependencies, configure the build environment, and compile the binary.

## 3. Running the Miner

After compiling the binary, you can start mining using the `mine.sh` script. The `mine.sh` script will prompt you for your mining pool URL, BTC address, and the number of threads you wish to use.

```bash
chmod +x mine.sh
./mine.sh
```

### Script Details:
- **Default Pool URL:** `stratum+tcp://fb.nodecattel.xyz:3333`
- **Password:** The password is set to `x` by default.
- **Configuration:** The script will save your pool URL, BTC address, and thread count in a configuration file (`mine.conf`) for future runs.

## 4. Starting Mining

When you run `mine.sh`, it will display the final command that will be executed to start the mining process:

```bash
./cpuminer -a sha256d -o "your_pool_url" -u "your_btc_address" -p "x" -t "number_of_threads"
```

After confirming, the miner will start using the parameters you have provided.

## 5. Credits

cpuminer-opt is a fork of cpuminer-multi by TPruvot with optimizations imported from other miners developed by lucas Jones, djm34, Wolf0, pooler, Jeff garzik, ig0tik3d, elmad, palmd, and Optiminer, with additional optimizations by Jay D Dee.
```
