import fs from 'fs';
import path from 'path';

import matter from 'gray-matter';

const postsDirectory = path.join(process.cwd(), 'content', 'posts');

export function getPostsFiles(dirPath = postsDirectory) {
  let results: string[] = [];
  const list = fs.readdirSync(dirPath);

  list.forEach(function (file) {
    file = path.join(dirPath, file);
    const stat = fs.statSync(file);

    if (stat && stat.isDirectory()) {
      /* Recurse into a subdirectory */
      results = results.concat(getPostsFiles(file));
    } else {
      /* Is a file */
      results.push(path.basename(file));
    }
  });

  return results.filter((file) => path.extname(file) === '.md');
}

type MatterData = {
  title: string;
  description: string;
  date: string;
  tags: string;
};

export type PostData = {
  slug: string;
  content: string;
} & MatterData;

export function getPostData(postIdentifier: string): PostData {
  const postSlug = path.basename(postIdentifier.replace(/\.md$/, ''));
  const filePath = path.join(postsDirectory, `${postIdentifier}.md`);
  const fileContent = fs.readFileSync(filePath, 'utf-8');
  const { data, content } = matter(fileContent);

  const postData = {
    slug: postSlug,
    ...(data as MatterData),
    content,
  };

  return postData;
}

export function getAllPosts() {
  const postFiles = getPostsFiles();

  const allPosts = postFiles.map((postFile) => {
    const postSlug = postFile.replace(/\.md$/, '');
    return getPostData(postSlug);
  });

  const sortedPosts = allPosts.sort((postA, postB) =>
    postA.date > postB.date ? -1 : 1
  );

  return sortedPosts;
}
