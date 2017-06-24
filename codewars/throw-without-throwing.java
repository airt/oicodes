// https://www.codewars.com/kata/throw-without-throwing

import java.util.*;

public class ThrowWithoutThrowing {

  public static void arrayIndexOutOfBound() {
    int $ = (new int[0])[0];
  }

  public static void negativeArraySize() {
    int $ = (new int[-1])[0];
  }

  public static void noSuchElement() {
    new ArrayList().iterator().next();
  }

  public static void arithmetic() {
    int $ = 1 / 0;
  }

  public static void classCast() {
    int $ = (Integer) new Object();
  }

  public static void stackOverflow() {
    stackOverflow();
  }

  public static void nullPointer() {
    ((Optional) null).toString();
  }

  public static void numberFormat() {
    Integer.parseInt("NaN");
  }

  public static void illegalArgument() {
    Character.toChars(-1);
  }

  public static void emptyStack() {
    new Stack().pop();
  }

  public static void bufferOverflow() {
    java.nio.ByteBuffer.allocate(0).put(new byte[1]);
  }

  public static void arrayStore() {
    ((Object[]) new Long[1])[0] = 0;
  }

  public static void unsupportedOperation() {
    Arrays.asList(new int[3]).remove(0);
  }

  public static void illegalState() {
    new ArrayList().iterator().remove();
  }

}
