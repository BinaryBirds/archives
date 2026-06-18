import type { Metadata } from 'next';
import { Inter, Montserrat, Roboto } from 'next/font/google';
import './globals.css';
import './syntax.css';
import Navbar from './components/navbar/navbar';

const montserrat = Montserrat({ subsets: ['latin'] });

export const metadata: Metadata = {
  title: 'Binary Birds HQ',
  description:
    'Server-side swift solutions from experts. Secure, efficient, scalable solutions.',
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang='en'>
      <body className={montserrat.className}>
        <Navbar />
        {children}
      </body>
    </html>
  );
}
