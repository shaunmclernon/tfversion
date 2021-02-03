# tfversion

Determine the version of [terraform](https://www.terraform.io) that was last used to apply changes, by inspecting the remote AWS S3 backend.

## Why

Terraform is moving pretty fast through its current versions of terraform. It is quite important that the same version be used so as not to corrupt the state file. As in most cases, it is usually easier harder to downgrade to a previous version.

As I work on a number of different terraform repos ranging from 0.11.0 up to 0.14.0. The goal of this repo is to tell me quickly which version was last used to apply the terraform and then I can switch to the appropriate version using [tfenv](https://github.com/tfutils/tfenv)

Granted, that from 0.13 it is possible to pin your terraform version and this is the favoured approach. However, there are still a lot of terraform repo's that are not using version pinning.

> NOTE: This is completely unrelated to `https://github.com/perriea/tfversion` but I liked the name as it summed up clearly what I wanted to do.

## Caveats

I built this purely for my benefit and currently work mostly with AWS, so this approach only works with the [S3 remote backend](https://www.terraform.io/docs/language/settings/backends/s3.html)

## Prequistes

The implementation is currently in bash as it was knocked up in a lunchtime. I may refactor it using python or golang as a future exercise.

- bash
- jq
- aws cli
- valid creds for the remote buckets you are planning to check.

## Install

    make install

## Test

    make test

## Usage

Go to a directory that has terraform in it. By default, it will look for HCL file named `state.tf`.

    tfversion

    tfversion state.tf

A tfvars can be used instead of HCL file.

    tfversion terraform.dev.backend-config.tfvars

