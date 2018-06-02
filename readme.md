# Readme

## About this project

To get started, make sure you have all the depencies installed.
See [Installation](/#installation).

## Demo

Put a link to your live version [here](#).


## Developement

### Installation

1. You will need to have `npm` installed.
2. Install any dependencies: `npm install`.
3. Install the Google Cloud Functions [offline emulator](https://github.com/GoogleCloudPlatform/cloud-functions-emulator).

### Usage

First, spin up the cloud emulator:

```bash
npm run start-server
```

After every change, deploy the function locally. This will deploy the function and call it once.

```bash
npm run deploy-local
```

To call it again, run:

```bash
npm run call
```

To inspect the logs, run:

```bash
npm run view-logs
```

To spin down the server when you're finished:

```bash
npm run stop-server
```

For more control, interact with the emulator directly on the command line (see `functions --help`).

### Build

When you're ready to deploy to Google Cloud, build the upload archive with:

```bash
npm run build
```

A `tar.gz` archive will be generated into the project directory.

On the Google Cloud webapp:

1. Create a new function
2. Choose "Upload an Archive"
3. Upload the generated archive.

## About the Files

* `index.js` is where all your logic goes.
* `package.json` is where you list your dependencies.

### Other

* `launch.json` is a config file for the VSCode debugger.

## Appendix

Deploying a function yourself:

```bash
functions deploy myFunction --trigger-http
```

You can then call it to see if it works:

```bash
functions call myFunction
```

For a rapid workflow, I like chaining both operations, so I can build and run my function with a single command:

```bash
functions deploy myFunction --trigger-http && functions call myFunction
```