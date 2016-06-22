#!/bin/bash

# Required parameters
if [ -z "${version_number}" ] ; then
  echo " [!] No 'Version Number' (version_number) specified!"
  exit 1
fi
if [ -z "${pre_release_identifier}" ] ; then
  echo " [!] No 'Pre-release identifier' (pre_release_identifier) specified!"
  exit 1
fi
if [ -z "${pre_release_initial_value}" ] ; then
  echo " [!] No 'Pre-release initial value' (pre_release_initial_value) specified!"
  exit 1
fi

pattern="${version_prefix}${version_number}${pre_release_identifier_prefix}${pre_release_identifier}${pre_release_number_prefix}*"
found_tag="$(git tag -l "${pattern}" | tail -1)"

pre_release_info=""
if [ -z "$found_tag" ]; then
	pre_release_info="${pre_release_identifier}${pre_release_number_prefix}${pre_release_initial_value}"
else
	pre_release_number="${found_tag#$pattern}"
	pre_release_number=$((pre_release_number+1))
	pre_release_info="${pre_release_identifier}${pre_release_number_prefix}${pre_release_number}"
fi

envman add --key APP_VERSION_PRE_RELEASE_INFO --value "${pre_release_info}"
envman add --key APP_VERSION_WITH_PRE_RELEASE_INFO --value "${version_prefix}${version_number}${pre_release_identifier_prefix}${pre_release_info}"

echo "Pre-release info: ${pre_release_info}"
echo "Version with pre-release info: ${version_prefix}${version_number}${pre_release_identifier_prefix}${pre_release_info}"

exit 0