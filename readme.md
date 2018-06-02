# Blank Google Cloud Function

Serverless is awesome! 
* Develop awesome Cloud Functions locally on your machine, 
* Deploy and test Functions locally (Uses the [emulator](https://github.com/GoogleCloudPlatform/cloud-functions-emulator))
* Build uploadable archives for deploying to Google Cloud.

## Quick Start

```bash
# Make sure you have the emulator installed (See #Installation)
mkdir myFunction
cd myFunction
git clone git@github.com:AnalyzePlatypus/Blank-Google-Cloud-Function.git
npm install

npm run start-server # Start the dev server
npm run deploy-local # Deploy the function and call it once
```

## Development

### Installation

1. You will need to have `npm` installed.
2. Install any dependencies: `npm install`.
3. Install the Google Cloud Functions [offline emulator](https://github.com/GoogleCloudPlatform/cloud-functions-emulator).

### Usage

First, spin up the cloud emulator:

```bash
npm run start-server
```

Make your changes to `index.js`.

Use `npm install <package> --save` to install any dependencies you need (GCP automatically installs `npm` packages in the cloud).

Deploy your function locally using: 

```bash
npm run deploy-local
```

This will deploy the function and call it once.

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

This is what `npm run deploy-local` uses.
