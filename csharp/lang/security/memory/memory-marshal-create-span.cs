namespace MemMarshalCreateSpan {
    public class MemMarshalCreateSpan {
        public void MarshalTest() {
            // ruleid: memory-marshal-create-span
            Span<T> ToSpan() => MemoryMarshal.CreateSpan(ref _e0, 1);

            // ruleid: memory-marshal-create-span
            Span<T> ToSpan() => MemoryMarshal.CreateReadOnlySpan(ref _e0, 2);

            // ruleid: memory-marshal-create-span
            Span<byte> span = MemoryMarshal.CreateSpan(ref Unsafe.AsRef(writer.Span.GetPinnableReference()), 4);

            // ruleid: memory-marshal-create-span
            Span<byte> span = MemoryMarshal.CreateReadOnlySpan(ref Unsafe.AsRef(writer.Span.GetPinnableReference()), 8);
        }
    }
}
