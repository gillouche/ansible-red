#!/usr/bin/env bash

/usr/bin/greenbone-feed-sync --type GVMD_DATA
/usr/bin/greenbone-feed-sync --type SCAP
/usr/bin/greenbone-feed-sync --type CERT

