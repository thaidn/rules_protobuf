// Copyright 2017 Google Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
////////////////////////////////////////////////////////////////////////////////

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import com.google.protobuf.GeneratedMessageLite;
import org.pubref.rules_protobuf.tests.LiteProto.Lite;
import org.pubref.rules_protobuf.tests.FullProto.Full;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

/**
 * Tests for Util.
 */
@RunWith(JUnit4.class)
public class JavaLiteTest {
  @Test
  public void testLiteProto() throws Exception {
    assertFalse(GeneratedMessageLite.class.isAssignableFrom(Full.class));
    assertTrue(GeneratedMessageLite.class.isAssignableFrom(Lite.class));
  }
}
