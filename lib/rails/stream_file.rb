module Rails
  # Include this to have a streamable file
  module StreamFile
    VERSION = "0.0.1"

    private

      def stream_file(enum, filename: "example.txt",
                                   mimetype: "text/plain")
        file_headers(filename, mimetype)
        streaming_headers
        response.status = 200
        self.response_body = enum
      end

      def file_headers(filename, mimetype)
        headers["Content-Type"] = mimetype
        headers["Content-Disposition"] = "attachment; filename=\"#{filename}\""
        headers["Content-Transfer-Encoding"] = "binary"
        headers["Last-Modified"] = Time.now.ctime.to_s
      end

      def streaming_headers
        headers["X-Accel-Buffering"] = "no"
        headers["Cache-Control"] ||= "no-cache"
        headers.delete("Content-Length")
      end
  end
end
