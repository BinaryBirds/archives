/** @type {import('next').NextConfig} */
const nextConfig = {
  output: 'export',
  distDir: 'dist',
  trailingSlash: true,
  images: {
    remotePatterns: [{ hostname: 'www.itprotoday.com' }],
    unoptimized: true,
  },
};

export default nextConfig;
