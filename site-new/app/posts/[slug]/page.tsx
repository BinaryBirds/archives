import Head from 'next/head';
import { Fragment } from 'react';

import PostContent from '../../components/posts/post-detail/post-content';
import { getPostData, getPostsFiles } from '@/app/utils/post-util';

function PostDetailPage({ params }: { params: { slug: string } }) {
  const { slug } = params;

  const post = getPostData(slug as string);

  return (
    <Fragment>
      <Head>
        <title>{post.title}</title>
        <meta name='description' content={post.description} />
      </Head>
      <PostContent post={post} />
    </Fragment>
  );
}

export function generateStaticParams() {
  const postFilenames = getPostsFiles();

  const slugs = postFilenames.map((fileName) => fileName.replace(/\.md$/, ''));

  return slugs.map((slug) => ({
    slug: slug,
  }));
}

export function generateMetadata({ params }: { params: { slug: string } }) {
  const { slug } = params;
  const post = getPostData(slug);

  return {
    title: post.title,
    description: post.description,
  };
}

export default PostDetailPage;
