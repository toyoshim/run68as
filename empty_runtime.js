// Copyright 2016 Takashi Toyoshima <toyoshim@gmail.com>. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

mergeInto(LibraryManager.library, {
  run68_abort: function() {},

  mem_get: function() {},
  mem_set: function() {},

  dos_call: function() {},
  iocs_call: function() {},
  magic2_call: function() {},
  pcm8_call: function() {},
  zmusic_call: function() {}
});
