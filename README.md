# Version pre-release info

Generate version containing pre-release information (`v1.0.0-alpha.1`, `2.4.1.beta+2`, `v2.0-rc.3`) based on git tags.

## How to use this Step

Define which pre-release identifier and initial number do you want to use for your workflow (`alpha`, `beta`, `rc`) and which format do you prefer. The provided app version will be extended with this information.

## Description

This step extends version provided as a parameter (`Version number`) with a pre-release identifier (`Pre-release identifier`, e.g. `alpha`, `beta`, `rc`)
and a pre-release number. The pre-release number is automatically incremented based on the existing git tags.
If there are no tags for the provided version, pre-release number is set to the initial value (`Pre-release initial value`).
Pre-release information is exported to the following environment variables:
- **APP_PRE_RELEASE_INFO** (e.g. `rc.3`)
- **APP_VERSION_WITH_PRE_RELEASE_INFO** (e.g. `v2.0-rc.3`)

You can use these environment variables in next steps (e.g. when creating a git tag).

## Outputs

Env Var | Description
------------ | -------------
`$APP_VERSION_PRE_RELEASE_INFO` | Pre-release info (e.g. `rc.3`)
`$APP_VERSION_WITH_PRE_RELEASE_INFO` | Version number containing pre-release info (e.g. `v2.0-rc.3`)
