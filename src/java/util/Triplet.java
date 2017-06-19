
package util;

public class Triplet<F, S, T> {
    private F first;
    private S second;
    private T third;

    public Triplet(F first, S second, T third) {
        this.first = first;
        this.second = second;
        this.third = third;
    }

    public void setFirst(F first) {
        this.first = first;
    }

    public void setSecond(S second) {
        this.second = second;
    }
    
    public void setThird(T third) {
      this.third = third;
    }

    public F getFirst() {
        return first;
    }

    public S getSecond() {
        return second;
    }
    
    public T getThird() {
      return third;
    }

    public void set(F first, S second, T third) {
        setFirst(first);
        setSecond(second);
        setThird(third);
    }
}
