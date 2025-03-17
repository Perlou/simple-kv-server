mod frame;
mod multiplex;
mod stream;
mod stream_result;
mod tls;

pub use frame::{read_frame, FrameCoder};

#[cfg(test)]
pub mod utils {
    use anyhow::Result;
    use bytes::{BufMut, BytesMut};
    use std::{cmp::min, task::Poll};
    use tokio::io::{AsyncRead, AsyncWrite};

    #[derive(Default)]
    pub struct DummyStream {
        pub buf: BytesMut,
    }
}
