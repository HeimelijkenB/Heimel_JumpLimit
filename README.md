
# Heimel_JumpLimit

**Heimel_JumpLimit** is a versatile and easy-to-configure FiveM script that enhances your server by limiting the number of consecutive jumps a player can perform before applying a ragdoll effect. Perfect for roleplay servers, this script helps maintain realistic player behavior and adds an extra layer of control for server administrators.

## Features

- Configurable maximum jump limit before ragdoll is triggered.
- Customizable cooldown time between jumps.
- Adjustable reset time to clear the jump count.
- Configurable duration for the ragdoll effect.
- Optional debug mode to track player actions and ensure smooth operation.

## Configuration Options

- `maxJumps`: Maximum allowed jumps before ragdoll (default: 2).
- `resetTime`: Time in milliseconds before reset (default: 5000 ms).
- `jumpCooldown`: Cooldown time between jumps in milliseconds (default: 1000 ms).
- `ragdollTime`: Time in milliseconds for the ragdoll effect (default: 1000 ms).
- `debug`: Enable or disable debug messages (default: true).

## Installation

1. **Download the Script**: Download the script and place the `Heimel_JumpLimit` folder in your `resources` directory.

2. **Add to server.cfg**: Add the following line to your `server.cfg` file to ensure the resource starts with your server:
   \`\`\`
   start Heimel_JumpLimit
   \`\`\`

3. **Configure the Script**: Open the `config.lua` file and customize the configuration options to suit your server's needs.

## Usage

Once installed and configured, the script will automatically enforce the jump limit and apply the ragdoll effect as per your settings. If debug mode is enabled, debug messages will be printed to the server console for monitoring purposes.

## Configuration

Edit the `config.lua` file to configure the following options:

\`\`\`lua
config = {
    maxJumps = 2,          -- Maximum allowed jumps before ragdoll
    resetTime = 5000,      -- Time in milliseconds before reset (5 seconds)
    jumpCooldown = 1000,   -- Cooldown time between jumps in milliseconds
    ragdollTime = 1000,    -- Time in milliseconds for the ragdoll effect
    debug = true           -- Enable or disable debug messages
}
\`\`\`

## Debugging

To enable or disable debug messages, set the `debug` option in the `config.lua` file:
\`\`\`lua
config = {
    maxJumps = 2,
    resetTime = 5000,
    jumpCooldown = 1000,
    ragdollTime = 1000,
    debug = true  -- Set to false to disable debug messages
}
\`\`\`

## Support

For support and suggestions, feel free to reach out on the Cfx.re forum thread. Contributions and feedback are always welcome!

Enjoy your improved server dynamics with Heimel_JumpLimit!

## License

This project is licensed under the MIT License - see the LICENSE file for details.
